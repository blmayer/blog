FROM alpine:3.15 as builder

RUN apk add tree curl

COPY . /root

RUN cd /root && \
	rm -rf .git && \
	curl "https://raw.githubusercontent.com/weblibs/template.sh/main/template" \
	| sh && \
	cd out && \
	curl "https://raw.githubusercontent.com/weblibs/genmap.sh/main/genmap" \
	| sh -s -- -d "https://saucecode.bar" posts/*.html > sitemap.txt && \
	chmod a+x main

FROM scratch

COPY --from=builder /root/out/ /www

CMD ["/www/main"]
