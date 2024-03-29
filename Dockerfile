# Build        : docker build --no-cache -t fishtest:latest .
# Run          : docker run -it --rm --pid=host -v worker-dir:/opt/fishtest/worker [-e "args=ARGS"] fishtest
# Export Image : docker save fishtest > fishtest.tar && xz -9 fishtest.tar
# Import Image : docker load -i fishtest.tar.xz && rm -f fishtest.tar.xz
# You may need sudo to run docker.

FROM alpine:3.16

RUN addgroup -g 1000 -S fishtest \
&& adduser -u 1000 -S -D -H -G fishtest -s /sbin/nologin fishtest \
&& apk update \
&& apk add python3 make g++ wget ca-certificates \
&& update-ca-certificates \
&& cd /opt/ \
&& wget https://github.com/glinscott/fishtest/archive/master.zip \
&& unzip master.zip && rm -f master.zip && mv fishtest-master fishtest 

RUN chmod 0777 /opt/fishtest/worker/ \
&& chown -R fishtest:fishtest /opt/fishtest/ \
&& rm -Rf /opt/fishtest/server \
&& rm -f /opt/fishtest/test_worker.sh \
&& rm -f /opt/fishtest/test_server.sh

USER fishtest

WORKDIR /opt/fishtest/worker/

CMD python3 worker.py $args

