FROM golang:alpine as builderadl

WORKDIR /go/src/app

COPY . .

RUN CGO_ENABLED=0 go build -o /app main.go

FROM scratch

COPY --from=builderadl /app /app

CMD ["/app"]