FROM netyazilim/alpine-base:3.9

ARG VERSION=1.7.8

WORKDIR /tmp
RUN wget --quiet https://dl.influxdata.com/chronograf/releases/chronograf-${VERSION}-static_linux_amd64.tar.gz -O chronograf.tar.gz  && \
    tar xvfz  chronograf.tar.gz  -C /tmp  --strip 2

FROM scratch
LABEL maintainer "Levent SAGIROGLU <LSagiroglu@gmail.com>"

EXPOSE 8888
ENV BOLT_PATH /etc/chronograf-v1-.db
VOLUME /shared

COPY --from=0 /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=0 /etc/localtime /etc/localtime
COPY --from=0 /etc/timezone /etc/timezone

COPY --from=0 /tmp/chronograf /bin/chronograf

ENTRYPOINT ["/bin/chronograf"]
CMD ["--log-level=error"]
