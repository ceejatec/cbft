//  Copyright (c) 2019 Couchbase, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// 		http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package cbft

import (
	"context"
	"fmt"

	"github.com/blevesearch/bleve/v2"
	"github.com/blevesearch/bleve/v2/search"
	"github.com/blevesearch/bleve/v2/search/query"
)

var deleteBatchSize = int(5000)

type delByQueryHandler struct {
	index       bleve.Index
	totDelCount int
}

func newDelByQueryHandler(i bleve.Index) *delByQueryHandler {
	return &delByQueryHandler{index: i}
}

type docDelHandler struct {
	batch *bleve.Batch
	delh  *delByQueryHandler
}

func (dph *docDelHandler) documentMatchHandler(hit *search.DocumentMatch) error {
	if hit != nil {
		dph.batch.Delete(hit.ID)
	}
	if dph.batch.Size() >= deleteBatchSize || hit == nil {
		err := dph.delh.index.Batch(dph.batch)
		if err != nil {
			return err
		}
		dph.delh.totDelCount += dph.batch.Size()
		dph.batch.Reset()
	}
	return nil
}

func (d *delByQueryHandler) MakeDocumentMatchHandler(
	ctx *search.SearchContext) (search.DocumentMatchHandler, bool, error) {
	dmh := docDelHandler{
		delh:  d,
		batch: d.index.NewBatch(),
	}
	return dmh.documentMatchHandler, true, nil
}

// deleteByQuery triggers the given query for the index and
// performs batched deletions for the hits synchronously in
// a blocking manner.
// In case of collection deletions, the usage could be from a per
// dcp feed like below,
// p := newDelByQueryHandler(t.bindex)
// n, err := p.deleteByQuery(query) where query is a match query
// against the `_scope_collection` field with the search text
// _$scope_$collection and analyzer `keyword`.
func (d *delByQueryHandler) deleteByQuery(query query.Query) (int, error) {
	var handlerMaker search.MakeDocumentMatchHandler
	handlerMaker = d.MakeDocumentMatchHandler
	ctx := context.WithValue(context.Background(),
		search.MakeDocumentMatchHandlerKey,
		handlerMaker)
	sr := &bleve.SearchRequest{
		Query: query,
		Size:  1,
	}
	_, err := d.index.SearchInContext(ctx, sr)
	if err != nil {
		return d.totDelCount, fmt.Errorf("bleve_delete: deleteByQuery failed, "+
			"for query: %+v, err: %v", *sr, err)
	}
	return d.totDelCount, err
}
