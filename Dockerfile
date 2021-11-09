FROM alpine/ansible

MAINTAINER Patrick Pötz <devops@wastebox.biz>

WORKDIR /ansible

COPY requirements_azure.txt /requirements_azure.txt

RUN pip install --upgrade pip && pip install -r /requirements-azure.txt

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
