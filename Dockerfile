# Build        : docker build --no-cache -t fishtest:latest .
# Run          : docker run -it --rm --pid=host -v worker-dir:/opt/fishtest/worker [-e "args=ARGS"] fishtest
# Export Image : docker save fishtest > fishtest.tar && xz -9 fishtest.tar
# Import Image : docker load -i fishtest.tar.xz && rm -f fishtest.tar.xz
# You may need sudo to run docker.

FROM alpine:edge

RUN addgroup -g 1000 -S fishtest \
&& adduser -u 1000 -S -D -H -G fishtest -s /sbin/nologin fishtest \
&& apk update \
&& apk add python3 make g++ wget ca-certificates \
&& update-ca-certificates \
&& cd /opt/ \
&& wget https://github.com/vdbergh/fishtest/archive/master.zip \
&& unzip master.zip && rm -f master.zip && mv fishtest-master fishtest 

ADD ./cutechess-cli /opt/fishtest/worker/testing/

RUN chmod 0777 /opt/fishtest/worker/ && chown -R fishtest:fishtest /opt/fishtest/ \
&& chown root:root /opt/fishtest/worker/testing/cutechess-cli && chmod 0711 /opt/fishtest/worker/testing/cutechess-cli

USER fishtest

WORKDIR /opt/fishtest/worker/

CMD python3 worker.py $args

