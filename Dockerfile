FROM alpine:3.10

RUN apk add --no-cache ca-certificates bash jq curl

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
