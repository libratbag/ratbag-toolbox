## Dissectors

How to use? Just copy them to your `~/.config/wireshark/plugins` folder or call wireshark with the script as an argument.
```
wireshark -X lua_script:dissectors/hidpp-dissector.lua
```
###### If you are using Wireshark GTK call `wireshark-gtk` instead

### HID++
###### Under development

#### Arguments
  - HID++ Initial Version (default: `2`)

To specify an argument you need to call wireshark directly.
```
wireshark -X lua_script:dissectors/hidpp-dissector.lua -X lua_script1:1
```
###### The command above sets the initial HID++ version as HID++ 1.0

##### Working
  - Detect protocol
  - Packet structure
  - Features
    - IRoot
    - IFeatureSet

### Steelseries
###### Planned, no active development yet
