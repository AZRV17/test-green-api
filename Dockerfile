FROM golang:1.25-alpine AS builder

WORKDIR /app

COPY main.go .
COPY go.mod .

RUN go build -o server main.go

FROM alpine:latest

WORKDIR /root/

COPY --from=builder /app/server .
COPY static ./static

EXPOSE 8080

CMD ["./server"]