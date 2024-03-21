#!/bin/sh

cd /boot

sudo rm initramfs-linux-fallback.img   initramfs-linux-fallback.img.tmp   initramfs-linux.img

cd

sudo cp /home/joel/scripts/qemu/vfio_nvidia/mkinitcpio/mkinitcpio_vfio.conf /etc/mkinitcpio.conf
echo -e "Copied mkinitcpio.conf"
sudo mkinitcpio -P

echo -e "Switching to VFIO drivers"
sudo cp /home/joel/scripts/qemu/vfio_nvidia/grub.cfg/grub_vfio /etc/default/grub
echo -e "Copied Grub config"
echo "Regenerating grub"
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo systemctl disable nvidia-powerd

echo -e "Completed Successfully\nRebooting in 5 seconds"



sleep 5
sudo reboot
