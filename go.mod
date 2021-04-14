module github.com/couchbase/cbft

go 1.13

require (
	github.com/RoaringBitmap/roaring v0.5.5 // indirect
	github.com/blevesearch/bleve-mapping-ui v0.4.0
	github.com/blevesearch/bleve/v2 v2.0.3
	github.com/blevesearch/bleve_index_api v1.0.0
	github.com/blevesearch/upsidedown_store_api v1.0.1
	github.com/blevesearch/zapx/v11 v11.2.0
	github.com/blevesearch/zapx/v12 v12.2.0
	github.com/blevesearch/zapx/v13 v13.2.0
	github.com/blevesearch/zapx/v14 v14.2.0
	github.com/blevesearch/zapx/v15 v15.2.0
	github.com/buger/jsonparser v1.1.1
	github.com/couchbase/cbauth v0.0.0-20201026062450-0eaf917092a2
	github.com/couchbase/cbftx v0.0.0-20210326203742-29e142235df3
	github.com/couchbase/cbgt v0.0.0-20210412150823-5fbd5c755c7e
	github.com/couchbase/clog v0.0.0-20190523192451-b8e6d5d421bc
	github.com/couchbase/go-couchbase v0.0.0-20210330201927-1d32284da76d
	github.com/couchbase/gomemcached v0.1.2 // indirect
	github.com/couchbase/goutils v0.0.0-20210118111533-e33d3ffb5401
	github.com/couchbase/moss v0.1.0
	github.com/dustin/go-jsonpointer v0.0.0-20160814072949-ba0abeacc3dc
	github.com/dustin/gojson v0.0.0-20160307161227-2e71ec9dd5ad // indirect
	github.com/elazarl/go-bindata-assetfs v1.0.1
	github.com/glycerine/go-unsnap-stream v0.0.0-20210130063903-47dfef350d96 // indirect
	github.com/golang/protobuf v1.5.2
	github.com/golang/snappy v0.0.3 // indirect
	github.com/google/gofuzz v1.1.0 // indirect
	github.com/google/uuid v1.2.0 // indirect
	github.com/gorilla/mux v1.8.0
	github.com/json-iterator/go v1.1.10
	github.com/julienschmidt/httprouter v1.1.1-0.20170430222011-975b5c4c7c21
	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd // indirect
	github.com/modern-go/reflect2 v1.0.1 // indirect
	github.com/pkg/errors v0.9.1 // indirect
	github.com/rcrowley/go-metrics v0.0.0-20201227073835-cf1acfcdf475 // indirect
	github.com/spf13/cobra v0.0.5
	github.com/tinylib/msgp v1.1.5 // indirect
	github.com/willf/bitset v1.1.11 // indirect
	golang.org/x/crypto v0.0.0-20210322153248-0c34fe9e7dc2 // indirect
	golang.org/x/net v0.0.0-20210410081132-afb366fc7cd1
	golang.org/x/sys v0.0.0-20210414055047-fe65e336abe0
	google.golang.org/genproto v0.0.0-20210413151531-c14fb6ef47c3 // indirect
	google.golang.org/grpc v1.37.0
)

replace github.com/couchbase/cbauth => ../goproj/src/github.com/couchbase/cbauth

replace github.com/couchbase/cbftx => ../cbftx

replace github.com/couchbase/cbgt => ../cbgt

replace github.com/couchbase/cbft => ./empty

replace github.com/couchbase/go-couchbase => ../goproj/src/github.com/couchbase/go-couchbase

replace github.com/couchbase/gomemcached => ../goproj/src/github.com/couchbase/gomemcached
