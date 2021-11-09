FROM alpine/ansible

RUN apk --update --no-cache add \
        ca-certificates \
        openssh-client \
        openssl \
        python3\
        py3-pip \
        py3-cryptography \
        sshpass

RUN apk --update add --virtual \
        .build-deps \
        python3-dev \
        libffi-dev \
        openssl-dev \
        build-base \
        curl \
 && pip3 install --upgrade \
        pip \
        cffi \
 && apk del \
        .build-deps \

RUN mkdir -p /ansible 
WORKDIR /ansible

COPY requirements_azure.txt /ansible/requirements_azure.txt

RUN pip3 install -r /ansible/requirements_azure.txt

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
