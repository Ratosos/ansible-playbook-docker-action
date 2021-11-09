FROM alpine/ansible

MAINTAINER Patrick Pötz <devops@wastebox.biz>

RUN mkdir -p /ansible 
WORKDIR /ansible

COPY requirements_azure.txt /ansible/requirements_azure.txt

RUN pip install --upgrade pip && pip install -r /ansible/requirements_azure.txt

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
