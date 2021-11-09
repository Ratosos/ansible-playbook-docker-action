FROM alpine/ansible

RUN apk --update add python3 py-pip openssl ca-certificates \
    && apk --update add --virtual build-dependencies python-dev libffi-dev openssl-dev build-base \
    && pip install --upgrade pip cffi \
    && echo "Removing package list..." \
    && apk del build-dependencies \
    && rm -rf /var/cache/apk/* 

RUN mkdir -p /ansible 
WORKDIR /ansible

COPY requirements_azure.txt /ansible/requirements_azure.txt

RUN pip install -r /ansible/requirements_azure.txt

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
