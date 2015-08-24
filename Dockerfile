FROM fluent/fluentd:latest
MAINTAINER mookjpy@gmail.com

USER ubuntu
WORKDIR /home/ubuntu
ENV PATH /home/ubuntu/ruby/bin:$PATH
EXPOSE 24284

VOLUME /var/lib/docker/containers
VOLUME /var/log/fluentd

RUN gem install fluent-plugin-google-cloud --no-rdoc --no-ri

CMD fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
