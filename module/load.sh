#!/usr/bin/env sh
OS_VERSION=$(echo "$BALENA_HOST_OS_VERSION" | cut -d " " -f 2)
echo "OS Version is $OS_VERSION"

modprobe videodev 
modprobe v4l2_fwnode
modprobe v4l2_async

rmmod imx477
echo Loading module from "$MOD_PATH"/imx477.ko
insmod "$MOD_PATH"/imx477.ko

# Sleep but respond to sigint
cd "$MOD_PATH" 
python -m http.server
