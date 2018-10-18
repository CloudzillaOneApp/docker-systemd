meh:
	docker build -t meh .

run:
	docker run -ti --rm --name meh --tmpfs /run --tmpfs /tmp -v /sys/fs/cgroup:/sys/fs/cgroup:ro --cap-add SYS_ADMIN meh

clean:
	docker rm -f meh

shell:
	docker exec -ti meh bash
