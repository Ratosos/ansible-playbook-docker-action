FROM alpine/ansible

RUN \
# apk add installs the following
 apk add \
   curl \
   python3 \
   py3-pip \
   py3-cryptography \
   py-boto \
   py-dateutil \
   py-httplib2 \
   py-jinja2 \
   py-paramiko \
   py-setuptools \
   py-yaml \
   openssh-client \
   bash \
   tar && \
 pip install --upgrade pip
 
RUN mkdir -p /ansible 
WORKDIR /ansible

COPY requirements_azure.txt /ansible/requirements_azure.txt

RUN pip3 install -r /ansible/requirements_azure.txt

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
