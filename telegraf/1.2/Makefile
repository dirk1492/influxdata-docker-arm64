.PHONY: build push
 
TAG = 1.2.1
REPO = dil001/telegraf-arm64

build:
	docker build --build-arg TELEGRAF_VERSION=$(TAG) -t $(REPO):$(TAG) .
	docker tag $(REPO):$(TAG) $(REPO)

push:
	docker -- push $(REPO):$(TAG)
	docker -- push $(REPO)

clean:
	docker rmi $(REPO):$(TAG)
