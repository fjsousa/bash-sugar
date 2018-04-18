function create-db-tunnel() {
  ssh -f -N -T -M -A "$TUNNEL_ENV-db-tunnel"
}

function destroy-db-tunnel() {
  ssh -T -O "exit" "$TUNNEL_ENV-db-tunnel"
}

function psql-puma-analytics() {
  echo "Tunneling into $TUNNEL_ENV"
  echo "PGPASSWORD size (should be > 0): " ${#PGPASSWORD}

  eval "create-$TUNNEL_ENV-db-tunnel"
  psql -h localhost -p $PSQL_PORT -U puma_analytics
}
