.PHONY: build push clean run

VERSION=1.2.0~beta2
TAG = 1.2.0-beta2-alpine
REPO = dil001/chronograf-arm64

build:
	docker build --build-arg VERSION=$(VERSION) -t $(REPO):$(TAG) .

push:
	docker -- push $(REPO):$(TAG)

clean:
	docker rmi $(REPO):$(TAG)

run:
	docker run -it --rm $(REPO):$(TAG)
