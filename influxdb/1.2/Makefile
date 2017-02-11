.PHONY: build push
 
TAG = 1.2.0
REPO = dil001/influxdb-arm64

build:
	docker build --build-arg VERSION=$(TAG) -t $(REPO):$(TAG) .
	docker tag $(REPO):$(TAG) $(REPO)

push:
	docker -- push $(REPO):$(TAG)
	docker -- push $(REPO)

clean:
	docker rmi $(REPO):$(TAG)
