FROM alpine:3.15 as builder

RUN apk add tree curl

COPY . /root

RUN cd /root && \
	rm -rf .git && \
	curl "https://raw.githubusercontent.com/weblibs/template.sh/main/template" \
	| sh && \
	cd out && \
	curl "https://raw.githubusercontent.com/weblibs/rssgen.sh/main/rssgen" \
	| sh -s -- -a "saucecode.bar" -t "the saucecode bar feed" -d "Programming, math and random posts feed for Brian Mayer's blog" posts/*.html > feed.rss && \
	curl "https://raw.githubusercontent.com/weblibs/genmap.sh/main/genmap" \
	| sh -s -- -d "https://saucecode.bar" * > sitemap.txt && \
	chmod a+x main

FROM scratch

COPY --from=builder /root/out/ /www

WORKDIR /www

CMD ["./main"]
