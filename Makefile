IMAGE ?= devops-lab
TAG ?= local

.PHONY: build run test-http

build:
	# Create (or reuse) a builder and build for arm64, then LOAD into local daemon
	docker buildx create --use --name builder 2>/dev/null || true
	docker buildx build --platform linux/arm64 -t $(IMAGE):$(TAG) --load .

run:
	docker run --rm -p 8000:8000 $(IMAGE):$(TAG)

test-http:
	python -m pip install -q requests pytest
	APP_URL=http://localhost:8000 pytest -q


test-http:
	python3 -m pip install --user requests pytest
	APP_URL=http://localhost:8000 python3 -m pytest -q
