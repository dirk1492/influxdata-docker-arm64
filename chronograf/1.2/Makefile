.PHONY: build push

VERSION = 1.2.0~beta2  
TAG = 1.2.0-beta2
REPO = dil001/chronograf-arm64

build:
	docker build --build-arg VERSION=$(VERSION) -t $(REPO):$(TAG) .
	docker tag $(REPO):$(TAG) $(REPO)

push:
	docker -- push $(REPO):$(TAG)
	docker -- push $(REPO):

clean:
	docker rmi $(REPO):$(TAG)
