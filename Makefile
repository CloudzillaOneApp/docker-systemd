recycle:
	$(MAKE) meh
	$(MAKE) clean
	$(MAKE) run
	$(MAKE) shell

meh:
	docker build -t cloudzilla/ubuntu-systemd:18.04 .

run:
	docker run -d -t --name meh --security-opt seccomp=unconfined --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro --cap-add SYS_ADMIN cloudzilla/ubuntu-systemd:18.04

clean:
	docker rm -f meh

shell:
	docker exec -ti meh bash
