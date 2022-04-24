FROM golang:latest AS builder

WORKDIR /usr/app

COPY hello.go /usr/app

RUN go build hello.go
RUN rm hello.go

FROM hello-world:latest

WORKDIR /usr/app

COPY --from=builder /usr/app .

ENTRYPOINT [ "./hello" ]

