# some tips

## enable wlan0

The driver is automatically loaded when the system boots, so we just need to:

1. modify the `ssid` and `psk` in the `/etc/wpa_supplicant.conf` configuration to set the ssid and password of the wifi
2. activate dhcp to get ip address

like this:

```bash
# edit /etc/wpa_supplicant.conf
vim /etc/wpa_supplicant.conf
# get ip address
udhcpc -i wlan0
```

## sdcard system expansion

> link: [香橙派(orangepi)扩展剩余SD卡存储空间](https://www.log4cpp.com/smarthome/63.html)

After flash the `sysimage-sdcard.img`, the system may take up most of the space,
but at this time the sdcard space is not all used up, so we can manually adjust the size of the system partition

```bash
df -h

fdisk /dev/mmcblk1

> p # Check the current partition status and device(/dev/mmcblk1p2) start address.

> d # we need remove /dev/mmcblk1p2
> 2

> n # next, we need create new partition
> p # create primary partition
> 2
> xxxx # Here is the previous starting address
> xxxx # here is the end address, default is fine

> w # write and save. may get an error here, but don't worry.

# after that we need to reboot and synchronize the partition information
reboot

resize2fs /dev/mmcblk1p2
```
