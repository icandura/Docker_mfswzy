FROM alpine:latest
MAINTAINER icandura <https://github.com/icandura/mfswzy>

RUN set -ex \
    && if [ $(wget -qO- ipinfo.io/country) == CN ]; then echo "http://mirrors.aliyun.com/alpine/latest-stable/main/" > /etc/apk/repositories ;fi \
    && apk --update add --no-cache bash wget libsodium py-pip libnet-dev libpcap-dev tzdata musl-dev openssh pwgen apache2 supervisor\
    && cp -r -f /usr/share/zoneinfo/Hongkong /etc/localtime \
    && pip --no-cache-dir install https://gitee.com/511311/ss/raw/master/shadowsocksr-manyuser.zip \
    && pip --no-cache-dir install supervisor-stdout
    

RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa && \
    sed -ri 's/^#PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
# echo "root:${PASSWORD}" | chpasswd && \
    mkdir -p /run/apache2 && \
    chown -R apache:apache /run/apache2

COPY net_speeder /usr/local/bin/
RUN chmod +x /usr/local/bin/net_speeder

RUN mkdir -p /etc/supervisor/conf.d/ /var/log/supervisor/
COPY supervisord.conf /etc/supervisor/supervisord.conf

# COPY entrypoint.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 22
EXPOSE 18388

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
