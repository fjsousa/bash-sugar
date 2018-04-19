sudo ifconfig en0 alias 192.168.4.1 broadcast 192.168.4.255
sudo ifconfig en0 alias 192.168.5.1 broadcast 192.168.5.255
sudo ifconfig en0 alias 192.168.6.1 broadcast 192.168.6.255

function create-kafka-tunnel() {
  echo "Creating Kafka tunnel into $TUNNEL_ENV"
  ssh -f -N -T -M -A "$TUNNEL_ENV-kafka-tunnel"
}

function destroy-kafka-tunnel() {
  echo "Destroy Kafka tunnel into $TUNNEL_ENV"
  ssh -T -O "exit" "$TUNNEL_ENV-kafka-tunnel"
}

echo "Network aliases config:"
ifconfig en0 | grep 192.168
