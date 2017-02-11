.PHONY: build push clean run

VERSION=1.1.0~beta6
TAG = 1.1.0-beta6-alpine
REPO = dil001/chronograf-arm64

build:
	docker build --build-arg VERSION=$(VERSION) -t $(REPO):$(TAG) .

push:
	docker -- push $(REPO):$(TAG)

clean:
	docker rmi $(REPO):$(TAG)

run:
	docker run -it --rm $(REPO):$(TAG)
