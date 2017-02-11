.PHONY: build push clean
 
SUBDIRS	= influxdb telegraf kapacitor chronograf 

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




