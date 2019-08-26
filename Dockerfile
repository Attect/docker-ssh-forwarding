FROM alpine
MAINTAINER Attect <attect@muka.app>

RUN apk add --update openssh-client && rm -rf /var/cache/apk/*

CMD rm -rf /root/.ssh && mkdir /root/.ssh && cp -R /root/ssh/* /root/.ssh/ && chmod -R 600 /root/.ssh/* && \
ssh \
-C \
-f \
-N \
-g \
-p $REMOTE_PORT \
-L $LOCAL_LISTEN_PORT:$LOCAL_LISTEN_HOST:$REMOTE_LISTEN_PORT $REMOTE_USER@$REMOTE_HOST \
&& while true; do sleep 10; done;
EXPOSE 1-65535
