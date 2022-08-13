FROM golang:1.16
COPY src/business_events_broker.go src/business_events_broker.go
RUN CGO_ENABLED=0 GOOS=linux go build src/business_events_broker.go 

FROM alpine:latest  
RUN apk --no-cache add ca-certificates
COPY --from=0 /go/business_events_broker ./appsrc/business_events_broker
RUN chown 1001:1001 /appsrc
USER 1001
CMD ["./appsrc/business_events_broker"]  
