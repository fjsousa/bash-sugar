sudo ifconfig en0 alias 192.168.4.1 broadcast 192.168.4.255
sudo ifconfig en0 alias 192.168.5.1 broadcast 192.168.5.255
sudo ifconfig en0 alias 192.168.6.1 broadcast 192.168.6.255

function create-uat-tunnel() {
  ssh -f -N -T -M -A uat-tunnel
}

function destroy-uat-tunnel() {
  ssh -T -O "exit" uat-tunnel
}

echo "Network aliases config:"
ifconfig en0 | grep 192.168
