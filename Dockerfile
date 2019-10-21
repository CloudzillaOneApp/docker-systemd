FROM ubuntu:18.04

# Note: this is a base image for ansible to provision
#       so we will leave /var/lib/apt/lists/ on the image

# Setup systemd
ENV container docker
RUN apt-get update && apt-get install -y dbus systemd
RUN systemctl set-default multi-user.target
STOPSIGNAL SIGRTMIN+3
ENTRYPOINT ["/sbin/init", "--log-target=journal"]
CMD []

# Additional packages for ansible
RUN apt-get install -y python sudo openssh-server openssh-client rsync
