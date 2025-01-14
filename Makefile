.PHONY: docker_build
docker_build:
	docker build --platform linux/amd64 -t tml .

.PHONY: docker_run
docker_run:
	docker run -it --rm \
	  -v /Users/pjhuang/src/gnn:/usr/src/app/tml \
	  -e PYTHONPATH="/usr/src/app" \
	  --network host \
	  -e SPEC_TYPE=chief \
	  tml

.PHONY: docker_test
docker_test:
	docker run -it --rm \
	  -v /Users/pjhuang/src/gnn:/usr/src/app/tml \
	  -e PYTHONPATH="/usr/src/app" \
	  --network host \
	  -e SPEC_TYPE=chief \
	  tml \
	  pytest -vv
