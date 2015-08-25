FROM fluent/fluentd:latest
MAINTAINER mookjpy@gmail.com

USER ubuntu
WORKDIR /home/ubuntu
ENV PATH /home/ubuntu/ruby/bin:$PATH
EXPOSE 24284

RUN gem install fluent-plugin-google-cloud --no-rdoc --no-ri

VOLUME /var/lib/docker/containers
VOLUME /fluentd/log

CMD fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
