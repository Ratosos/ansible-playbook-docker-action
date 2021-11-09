FROM alpine/ansible

MAINTAINER Patrick Pötz <devops@wastebox.biz>

RUN mkdir -p /ansible 
WORKDIR /ansible

COPY requirements_azure.txt /ansible/requirements_azure.txt

RUN cd /ansible && pip install --upgrade pip && pip install -r requirements-azure.txt

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
