.PHONY: build push

VERSION=1.1.1
TAG = $(VERSION)-alpine
REPO = dil001/influxdb-arm64

build:
	docker build --build-arg VERSION=$(VERSION) -t $(REPO):$(TAG) .

push:
	docker -- push $(REPO):$(TAG)

clean:
	docker rmi $(REPO):$(TAG)
