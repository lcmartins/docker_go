FROM golang:alpine AS builder

RUN apk update && apk add --no-cache git

WORKDIR /go/src/app/go-app-desafio

COPY . .

ADD test.go .

RUN go mod init

RUN go get -d -v

RUN go build -o /go-app-desafio

FROM scratch

COPY --from=builder /go-app-desafio /go/bin/go-app-desafio

CMD ["./go/bin/go-app-desafio"]
