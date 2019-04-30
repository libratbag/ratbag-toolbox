#!/bin/bash -e

root="${BASH_SOURCE%/*}/.."

# HID++
tshark -X lua_script:$root/dissectors/hidpp-dissector.lua -X lua_script1:1 -r $root/dumps/logitech/g500-init.pcapng # HID++ 1.0
tshark -X lua_script:$root/dissectors/hidpp-dissector.lua -X lua_script1:1 -r $root/dumps/logitech/g502-init.pcapng # HID++ 1.0
tshark -X lua_script:$root/dissectors/hidpp-dissector.lua -X lua_script1:1 -r $root/dumps/logitech/g603-init.pcapng # HID++ 1.0 (receiver) > HID++ 2.0 (device)
tshark -X lua_script:$root/dissectors/hidpp-dissector.lua -X lua_script1:1 -r $root/dumps/logitech/unifying-5devices-kernel-init.pcapng # HID 1.0 (receiver)

