.PHONY: build push

VERSION=1.1.2
TAG = $(VERSION)-alpine
REPO = dil001/telegraf-arm64

build:
	docker build --build-arg TELEGRAF_VERSION=$(VERSION) -t $(REPO):$(TAG) .

push:
	docker -- push $(REPO):$(TAG)

clean:
	docker rmi $(REPO):$(TAG)
