.PHONY: build push
 
TAG = 1.1.1
REPO = dil001/kapacitor-arm64

build:
	docker build --build-arg VERSION=$(TAG) -t $(REPO):$(TAG) .

push:
	docker -- push $(REPO):$(TAG)

clean:
	docker rmi $(REPO):$(TAG)
