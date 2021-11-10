FROM centos:7

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN yum check-update; \
    yum install -y gcc libffi-devel openssl-devel bzip2-devel python3.8 ; \
    yum install -y python3-pip; \
    yum install -y wget; \
    #wget https://www.python.org/ftp/python/3.8.12/Python-3.8.12.tgz \
    #tar xzf Python-3.8.12.tgz \
    #cd Python-3.8.12 \
    #./configure --enable-optimizations \
    #make altinstall \
    yum clean all

RUN pip3 install --upgrade pip; \
    pip3 install --upgrade virtualenv; \
    pip3 install pywinrm[kerberos]; \
    pip3 install pywinrm; \
    pip3 install jmspath; \
    pip3 install requests; \
    python3 -m pip install ansible; \
    wget -q https://raw.githubusercontent.com/ansible-collections/azure/dev/requirements-azure.txt; \
    pip3 install -r requirements-azure.txt; \
    rm requirements-azure.txt; \
    ansible-galaxy collection install azure.azcollection

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
