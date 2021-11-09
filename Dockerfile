FROM alpine/ansible

MAINTAINER Patrick Pötz <devops@wastebox.biz>

RUN apk --update --no-cache add \
        openssl \
&& pip install \
        msrestazure

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
