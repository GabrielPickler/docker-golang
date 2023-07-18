FROM golang:1.19 AS builder

WORKDIR /app

COPY . /app

RUN CGO_ENABLED=0 GOOS=linux go build -o go hello.go

FROM scratch
WORKDIR /app

COPY --from=builder /app/go .
CMD ["./go"]