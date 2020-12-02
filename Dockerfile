FROM fluent/fluentd:v1.11-debian-1

USER root

RUN apt-get update \
 && apt-get install -y --no-install-recommends $buildDeps \
 && gem install fluent-plugin-elasticsearch \
 && gem sources --clear-all \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

USER fluent
