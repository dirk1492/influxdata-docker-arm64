.PHONY: build push

VERSION = 1.1.0~beta6  
TAG = 1.1.0-beta6
REPO = dil001/chronograf-arm64

build:
	docker build --build-arg VERSION=$(VERSION) -t $(REPO):$(TAG) .

push:
	docker -- push $(REPO):$(TAG)

clean:
	docker rmi $(REPO):$(TAG)

run:
	docker run -it --rm $(REPO):$(TAG)
