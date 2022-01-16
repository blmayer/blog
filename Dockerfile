FROM golang:1.16 as builder

RUN cat << EOF > /root/main.go \
package main

import (
	"net/http"
	"os"
)

func main() {
	e := http.ListenAndServe(":"+os.Getenv("PORT"), http.FileServer(http.Dir("")))
	if e != nil {
		panic(e)
	}
}
EOF

RUN cd /root && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build

FROM scratch

COPY --from=builder /root/main /

CMD ["/main"]
