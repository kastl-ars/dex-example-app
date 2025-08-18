FROM golang:1.24.6-alpine3.21 as builder
WORKDIR /src/app
COPY main.go templates.go ./
RUN go mod init example-app
RUN go mod tidy
RUN go build -o example-app

#
FROM alpine:3.22
WORKDIR /root/
COPY --from=builder /src/app/example-app ./app/
CMD ["./app/example-app"]
