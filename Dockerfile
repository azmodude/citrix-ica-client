FROM fedora:41

ARG ICACLIENT_VERSION

RUN groupadd -g 1000 citrix && \
  useradd -m -u 1000 -g 1000 citrix

RUN dnf install -y --setopt=install_weak_deps=False \
  /host/ICAClient-rhel-${ICACLIENT_VERSION}.x86_64.rpm \
  openssl libsecret pulseaudio pulseaudio-utils nss && \
  dnf clean all

COPY certs/*.pem /opt/Citrix/ICAClient/keystore/cacerts
RUN openssl rehash /opt/Citrix/ICAClient/keystore/cacerts/

RUN mkdir /home/citrix/.ICAClient
COPY config/*.ini /home/citrix/.ICAClient
RUN touch /home/citrix/.ICAClient/.eula_accepted
RUN chown -R citrix:citrix /home/citrix/.ICAClient

ENTRYPOINT ["/opt/Citrix/ICAClient/wfica.sh"]
