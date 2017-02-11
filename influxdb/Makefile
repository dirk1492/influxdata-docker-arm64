.PHONY: build push clean
 
SUBDIRS	= 1.1 1.1/alpine 1.2 1.2/alpine

build:
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir build; \
	done 

push:
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir push; \
	done 

clean:
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir clean; \
	done 




