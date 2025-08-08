FROM alpine:3.19@sha256:3be987e6cde1d07e873c012bf6cfe941e6e85d16ca5fc5b8bedc675451d2de67

RUN apk add --no-cache ca-certificates bash jq curl

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
