FROM golang:alpine as builder

# RUN apk add --no-cache make git
# WORKDIR /proxypool-src
# COPY . /proxypool-src
# RUN go mod download && \
#     make docker && \
#     mv ./bin/proxypool-docker /proxypool

# FROM alpine:latest

# RUN apk add --no-cache ca-certificates tzdata
# WORKDIR /proxypool-src
# COPY ./assets /proxypool-src/assets
# COPY --from=builder /proxypool /proxypool-src/
# ENTRYPOINT ["/proxypool-src/proxypool", "-d"]

WORKDIR /app
ADD . .
RUN go build -o /usr/local/bin/proxypool

EXPOSE 8080
EXPOSE 12580
CMD ["/usr/local/bin/proxypool"]