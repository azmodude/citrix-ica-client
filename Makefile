ICACLIENT_VERSION := 24.2.0.65-0

build:
	podman build -t citrix-ica-client -v $(shell pwd):/host \
		--build-arg ICACLIENT_VERSION=$(ICACLIENT_VERSION) $(shell pwd)

