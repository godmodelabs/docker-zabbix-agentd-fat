FROM godmodelabs/docker-zabbix-agentd:zabbix32
MAINTAINER it-operations@boerse-go.de

ENV INSTALL_GEMS="rbvmomi mysql2 zabbixapi"
ENV INSTALL_PACKAGES="curl ruby-nokogiri ruby-trollop ruby-net-ldap ruby-mail ruby-ipaddress ruby-redis bundler ruby-net-ssh"
ENV INSTALL_PACKAGES_TEMP="ruby-dev gcc libmysqlclient-dev"

RUN apt-get update -y && \
    apt-get install -y $INSTALL_PACKAGES $INSTALL_PACKAGES_TEMP && \
    gem install $INSTALL_GEMS && \
    apt-get purge -y $INSTALL_PACKAGES_TEMP && \
    apt-get clean && rm -r /var/lib/apt/lists/*
