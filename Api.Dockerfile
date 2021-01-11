FROM golang:alpine AS builder
WORKDIR $GOPATH/src/go-api
COPY . .
RUN go build -o /app ./main.go
FROM alpine:3.8
COPY --from=builder /app .
CMD ["/app"]
