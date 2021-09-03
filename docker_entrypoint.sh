#!/bin/bash

service dbus start
bluetoothd &

cd /meizu_ble/custom_components/meizu_ble#
python3 meizu_ble.py &
