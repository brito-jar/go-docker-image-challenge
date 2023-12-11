FROM golang:1.21-alpine AS builder

WORKDIR /usr/src/app

COPY . .

RUN CGO_ENABLED=0 go build -ldflags="-w -s" -o /usr/bin/app ./...

FROM scratch

COPY --from=builder /usr/bin/app /usr/bin/app

CMD ["app"]