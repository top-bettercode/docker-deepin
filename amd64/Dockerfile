FROM debian

ENV DEBIAN_FRONTEND=noninteractive

COPY ./stable /usr/share/debootstrap/scripts/stable
COPY ./deepin-archive-keyring.gpg /usr/share/keyrings/deepin-archive-keyring.gpg
COPY ./deepin-pools-keyring.gpg /root/deepin-pools-keyring.gpg
RUN apt-get update && apt-get install -y debootstrap && \
    debootstrap --variant=minbase --no-check-gpg --arch=amd64 lion rootfs http://packages.deepin.com/deepin/ && \
    cp /usr/share/keyrings/deepin-archive-keyring.gpg rootfs/etc/apt/trusted.gpg.d/ && \
    cp /root/deepin-pools-keyring.gpg rootfs/etc/apt/trusted.gpg.d/ && \
    chroot ./rootfs apt-get autoclean && \
    chroot ./rootfs apt-get clean && \
    chroot ./rootfs rm -rvf /usr/share/icons/Adwaita && \
    chroot ./rootfs find /var/lib/apt/lists -type f -delete && \
    chroot ./rootfs find /var/cache -type f -delete && \
    chroot ./rootfs find /var/log -type f -delete && \
    chroot ./rootfs find /usr/share/doc -type f -delete && \
    chroot ./rootfs find /usr/share/man -type f -delete && \
    chroot ./rootfs find /usr/share/locale -type f -delete

FROM scratch
LABEL maintainer='Peter Wu <piterwu@outlook.com>'
COPY --from=0 /rootfs /

ENV TERM=xterm \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.utf8 \
    PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/sbin:/usr/sbin

RUN rm /bin/sh && \
    ln -s /bin/bash /bin/sh && \
    sed -i "s/mesg n/tty -s \&\& mesg n/" /root/.profile && \
    apt-get update && \
    apt --fix-broken -y install && \
    apt-get -y autoremove --purge && apt-get autoclean -y && apt-get clean -y && \
    find /var/lib/apt/lists -type f -delete && \
    find /var/cache -type f -delete && \
    find /var/log -type f -delete && \
    find /usr/share/doc -type f -delete && \
    find /usr/share/man -type f -delete

CMD ["/bin/bash"]
