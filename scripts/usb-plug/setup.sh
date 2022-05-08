sudo cp 10-usb-plug.rules /etc/udev/rules.d/
sudo cp usb-plug.service /etc/systemd/system
sudo systemctl enable usb-plug.service
sudo systemctl start usb-plug.service
