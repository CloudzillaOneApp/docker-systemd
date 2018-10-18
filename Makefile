recycle:
	$(MAKE) meh
	$(MAKE) clean
	$(MAKE) run
	$(MAKE) shell

meh:
	docker build -t meh .

run:
	docker run -d -t --name meh --security-opt seccomp=unconfined --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro --cap-add SYS_ADMIN meh

clean:
	docker rm -f meh

shell:
	docker exec -ti meh bash
