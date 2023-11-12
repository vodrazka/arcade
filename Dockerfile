FROM alpine:latest
RUN apk add openssh curl git
COPY operator /operator
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY play.sh /play.sh
RUN chmod a+x /play.sh
COPY sshd_config /etc/ssh/sshd_config
ENTRYPOINT ["/entrypoint.sh"]
