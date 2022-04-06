ICACLIENT_VERSION := 22.3.0.24-0

build:
	podman build -t citrix-ica-client -v $(shell pwd):/host \
		--build-arg ICACLIENT_VERSION=$(ICACLIENT_VERSION) $(shell pwd)

