FROM ubuntu:18.04

ENV container docker

RUN apt-get update && apt-get install -y dbus systemd && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN find /etc/systemd -name '*.timer' | xargs rm -v

RUN systemctl set-default multi-user.target

COPY setup /sbin/

STOPSIGNAL SIGRTMIN+3

ENTRYPOINT ["/sbin/init", "--log-target=journal"]

CMD []
