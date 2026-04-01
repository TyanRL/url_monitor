FROM alpine:3.20

RUN apk add --no-cache curl tzdata

WORKDIR /app

COPY check.sh /app/check.sh
COPY urls.txt /app/urls.txt

RUN chmod +x /app/check.sh

CMD ["/app/check.sh"]