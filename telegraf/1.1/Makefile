.PHONY: build push
 
TAG = 1.1.2
REPO = dil001/telegraf-arm64

build:
	docker build --build-arg TELEGRAF_VERSION=$(TAG) -t $(REPO):$(TAG) .

push:
	docker -- push $(REPO):$(TAG)

clean:
	docker rmi $(REPO):$(TAG)
