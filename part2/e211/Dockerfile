FROM ubuntu:18.04

WORKDIR /src
RUN mkdir toolchain

RUN apt-get update
RUN apt-get -y install wget
RUN apt-get -y install xz-utils apt-utils
RUN apt-get -y install abootimg

# Don't get stuck at interactive prompt!
ENV TZ=Europe/Helsinki
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN wget releases.linaro.org/components/toolchain/binaries/latest-7/aarch64-linux-gnu/gcc-*-x86_64_aarch64-linux-gnu.tar.xz
RUN tar -xf gcc-*-x86_64_aarch64-linux-gnu.tar.xz -C ./toolchain --strip-components=1

RUN apt-get -y install git build-essential kernel-package fakeroot libncurses5-dev libssl-dev ccache

RUN git clone http://git.linaro.org/landing-teams/working/qualcomm/kernel.git

#RUN cd kernel
WORKDIR /src/kernel

RUN git checkout origin/release/qcomlt-4.14 -b my-custom-4.14

# RUN export ARCH=arm64
# RUN export CROSS_COMPILE=`pwd`/../toolchain/bin/aarch64-linux-gnu-
ENV ARCH=arm64
ENV CROSS_COMPILE=/src/toolchain/bin/aarch64-linux-gnu-

RUN make defconfig distro.config

### buid the kernel ###
RUN make -j$(nproc) Image.gz dtbs
RUN make -j$(nproc) modules    

# DTB has to be appended to the compressed kernel image:
RUN cat arch/$ARCH/boot/Image.gz arch/$ARCH/boot/dts/qcom/apq8016-sbc.dtb > Image.gz+dtb

# abootimg requires a ramdisk, but we don't really use it, so create a dummy one:
RUN echo "not a ramdisk" > ramdisk.img
  
# finally, generate the boot image (here our rootfs is located an mmcblk0p10 partition)
RUN abootimg --create boot-db410c.img -k Image.gz+dtb -r ramdisk.img \
           -c pagesize=2048 -c kerneladdr=0x80008000 -c ramdiskaddr=0x81000000 \
           -c cmdline="root=/dev/mmcblk0p10 rw rootwait console=tty0 console=ttyMSM0,115200n8"