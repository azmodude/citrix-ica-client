## Requirements

- podman
- xhost

## Fetch ICAClient RPM from Citrix Website

[ICAClient-rhel-24.2.0.65-0.x86_64.rpm](https://downloads.citrix.com/22629/ICAClient-rhel-24.2.0.65-0.x86_64.rpm?__gda__=exp=1725554943~acl=/*~hmac=f053243723c6b53cce2e9c79d8a1365e2c9964b30856bcd8f898b8f7dcf5aa03)

The Link isn't a permalink, you may have to look on https://www.citrix.com/ for the download of the Citrix Workspace app for Linux (x86_64)A for RedHat.

## Make the container

```make build```

## Start the Shitrix Session

./citrix-run.sh /path/to/your/file.ica
 
