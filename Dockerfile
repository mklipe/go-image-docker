
FROM golang:1.16.2-alpine AS builder
RUN apk add --update --no-cache \
  build-base \ 
  upx
WORKDIR /app
COPY . .
RUN go build -o main . && \
  upx main

FROM scratch
WORKDIR /root/
COPY --from=builder /app .
CMD ["./main"]