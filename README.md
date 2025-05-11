# Allwinner Buildroot external tree

This repository is a Buildroot `BR2_EXTERNAL` tree dedicated to
supporting the Allwinner f1c200 platforms. But currently only tested on
[Widora Tiny200](https://mangopi.org/mangopi_r)

## Getting started

In order to use [Buildroot](https://www.buildroot.org), you need to
have a Linux distribution installed on your workstation. Any
reasonably recent Linux distribution (Ubuntu, Debian, Fedora, Redhat,
OpenSuse, etc.) will work fine.

Then, you need to install a small set of packages, as described in the
[Buildroot manual System requirements
section](https://buildroot.org/downloads/manual/manual.html#requirement).

There are also optional dependencies if you want to use Buildroot features
like interface configuration, legal information or documentation.
Please see the [corresponding manual section](https://buildroot.org/downloads/manual/manual.html#requirement-optional).

Next, we just need to:

```bash
# get buildroot
# git clone -b 2025.02.1 https://github.com/buildroot/buildroot
$ git clone -b 2023.05.1 https://github.com/buildroot/buildroot
# get external tree
$ git clone https://github.com/NU-LL/buildroot-external-allwinner
# configure and build
$ cd buildroot/
buildroot/ $ make BR2_EXTERNAL=../buildroot-external-allwinner xxx_defconfig
# download some package
buildroot/ $ make BR2_EXTERNAL=../buildroot-external-allwinner source
# start the build
buildroot/ $ make
```

NOTE: Currently you are able to choose the following configuration for the above `xxx_defconfig` parameter:

* tiny200_defconfig
* walnutpi_defconfig

## Flashing and booting the system

The Buildroot configurations generate a ready-to-use SD card image,
available as `output/images/sysimage-sdcard.img`. Flash this image on a SD card:

```bash
buildroot/ $ sudo dd if=output/images/sysimage-sdcard.img of=/dev/sdX bs=1M
```

## configure other

Sometimes we need to configure some packages:

```bash
# configure buildroot
buildroot/ $ make menuconfig
# configure uboot
buildroot/ $ make uboot-menuconfig
buildroot/ $ make uboot-rebuild
# configure kernel
buildroot/ $ make linux-menuconfig
buildroot/ $ make linux-rebuild
```
