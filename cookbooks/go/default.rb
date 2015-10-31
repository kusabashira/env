directory "/home/wara/work"
directory "/home/wara/work/go"

define :go_get do
  uri = params[:name]
  dst = "/home/wara/work/go/src/#{uri}"
  execute "go get #{uri}" do
    command "GOPATH=/home/wara/work/go go get #{uri}"
    not_if  "test -e #{dst}"
  end
end

go_get 'golang.org/x/tools/cmd/gorename'
go_get 'github.com/rogpeppe/godef'
go_get 'github.com/nsf/gocode'
go_get 'github.com/golang/lint/golint'
go_get 'github.com/bradfitz/goimports'
go_get 'github.com/jteeuwen/go-bindata'
