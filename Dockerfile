FROM alpine:3.15 as builder

RUN apk add curl

COPY www www

RUN cd /www && \
	rm -rf .git && \
	curl "https://raw.githubusercontent.com/weblibs/template.sh/main/template" \
	| sh && \
	cd out && \
	curl "https://raw.githubusercontent.com/weblibs/rssgen.sh/main/rssgen" \
	| sh -s -- -a "saucecode.bar" -t "the saucecode bar feed" -d "Programming, math and random posts feed for Brian Mayer's blog" posts/*.html > rss.xml && \
	curl "https://raw.githubusercontent.com/weblibs/genmap.sh/main/genmap" \
	| sh -s -- -d "https://saucecode.bar" * > sitemap.txt

FROM scratch

COPY --from=builder /www/out/ /
COPY main .

CMD ["./main"]
