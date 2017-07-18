FROM gitlab/gitlab-ce:9.3.4-ce.0

MAINTAINER youhouhouhou

ARG buildno

#ENV LANG en_US.UTF-8
#ENV LC_ALL en_US.UTF-8
#
#ENV JAVA_OPTS -Duser.language=zh -Duser.region=CN -Dfile.encoding='UTF-8' -Duser.timezone='Asia/Shanghai'


RUN sed -i 's/http:\/\/archive.ubuntu.com\/ubuntu\//http:\/\/mirrors.163.com\/ubuntu\//g' /etc/apt/sources.list && \
    apt-get update -y && \
    apt-get install -y vim curl net-tools jq && \
    apt-get -q autoremove && \
    apt-get -q clean -y && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/*.bin



#https://github.com/maxcnunes/waitforit
#ADD install_waitforit.sh /root/
#RUN /root/install_waitforit.sh
# version 1.4.0
COPY waitforit-linux_amd64 /usr/local/bin/waitforit
RUN chmod +x /usr/local/bin/waitforit

RUN echo "Asia/shanghai" > /etc/timezone;

ADD entrypoint.sh /root/
ADD init.sh /root/
RUN chmod 755 /root/*.sh

ENTRYPOINT ["/root/entrypoint.sh"]
CMD ["/usr/local/bin/wrapper"]