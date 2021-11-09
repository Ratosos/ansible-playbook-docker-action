FROM alpine/ansible

RUN \
# apk add installs the following
 apk add \
   curl \
   python3 \
   py3-pip \
   py-boto \
   py-dateutil \
   py-httplib2 \
   py-paramiko \
   py-setuptools \
   py-yaml \
   openssh-client \
   bash \
   tar && \
 pip install --upgrade pip

RUN mkdir -p /ansible 
WORKDIR /ansible

RUN pip install azureml-sdk --no-cache-dir
RUN pip install --upgrade azureml-core

#COPY requirements_azure.txt /ansible/requirements_azure.txt

#RUN pip3 install -r /ansible/requirements_azure.txt

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
