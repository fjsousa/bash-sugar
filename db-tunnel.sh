function create-db-tunnel() {

  if [ -z "$(lsof -i tcp:$PSQL_PORT | grep ssh)" ]; then
    echo "Creating ssh tunnel into $TUNNEL_ENV"
    ssh -f -N -T -M -A "$TUNNEL_ENV-db-tunnel"
  else
   echo "ssh tunnel already exists $PSQL_PORT:$TUNNEL_ENV"
  fi
}

function destroy-db-tunnel() {
  ssh -T -O "exit" "$TUNNEL_ENV-db-tunnel"
}

function psql-puma-analytics() {

  echo "PGPASSWORD size (should be > 0): " ${#PUMA_ANALYTICS_PASS}

  create-db-tunnel
  PGPASSWORD=$PUMA_ANALYTICS_PASS psql -h localhost -p $PSQL_PORT -U puma_analytics
}

function psql-us-investor-api() {

  echo "PGPASSWORD size (should be > 0): " ${#US_INVESTOR_API_PASS}

  create-db-tunnel
  PGPASSWORD=$US_INVESTOR_API_PASS psql -h localhost -p $PSQL_PORT -U product_unit_manager -d investor_api_view
}
