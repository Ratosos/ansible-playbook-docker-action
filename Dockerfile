FROM alpine/ansible

MAINTAINER Patrick Pötz <devops@wastebox.biz>

RUN apk --update --no-cache add \
        python3 \
&& pip3 install \
        msrestazure

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
