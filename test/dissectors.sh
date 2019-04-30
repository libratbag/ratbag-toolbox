#!/bin/bash -e

root="${BASH_SOURCE%/*}/.."

declare -A hidpp_test_cases

# HID++
# dump file => HID++ version
hidpp_test_cases=(
  ['g500-init']=1				# HID++ 1.0
  ['g502-init']=1				# HID++ 1.0
  ['g603-init']=1				# HID++ 1.0 (receiver) > HID++ 2.0 (device)
  ['unifying-5devices-kernel-init']=1		# HID++ 1.0 (receiver)
)

for dump in "${!hidpp_test_cases[@]}"; do
  printf "Testing HID++ dissector against $dump.pcapng..."

  output="$(tshark -X lua_script:"$root"/dissectors/hidpp-dissector.lua -X lua_script1:"${hidpp_test_cases[$dump]}" -r "$root"/dumps/logitech/"$dump".pcapng 2>&1 >/dev/null)"

  if [[ -n "$output" ]]; then
    printf ' FAILED\n\n'
    echo "$output"
  fi
  printf '\n'

done

