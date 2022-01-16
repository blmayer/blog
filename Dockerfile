FROM golang:1.16 as builder

COPY . /root

RUN cd /root && \
	rm -rf .git && \
	curl "https://raw.githubusercontent.com/weblibs/template.sh/main/template" \
	| sh && \
	chmod a+x out/main

FROM scratch

COPY --from=builder /root/out/ /

CMD ["/main"]
