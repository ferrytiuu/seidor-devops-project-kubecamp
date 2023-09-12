FROM golang:1.21-bullseye as builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN go build -o ./bin/app .

FROM busybox:glibc
COPY --from=builder /app/bin/app /bin/app

LABEL lang="go"
LABEL type="app"
EXPOSE 8080

CMD [ "app" ]