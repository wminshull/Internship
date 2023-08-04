import usb_hid

usb_hid.enable((Device.KEYBOARD), boot_device=1)
print(usb_hid.get_boot_device())