FROM golang:1.16
COPY src/httpserver.go src/httpserver.go
RUN CGO_ENABLED=0 GOOS=linux go build src/httpserver.go 

FROM alpine:latest  
RUN apk --no-cache add ca-certificates
COPY --from=0 /go/httpserver ./appsrc/httpserver
RUN chown 1001:1001 /appsrc
USER 1001
CMD ["./appsrc/httpserver"]  
