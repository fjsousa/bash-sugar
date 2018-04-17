function create-uat-db-tunnel() {
  ssh -f -N -T -M -A uat-db-tunnel
}

function destroy-uat-db-tunnel() {
  ssh -T -O "exit" uat-db-tunnel
}

function psql-uat-puma-analytics() {
  echo "PGPASSWORD size (should be > 0): " ${#PGPASSWORD}

  create-uat-db-tunnel
  psql -h localhost -p 9001 -U puma_analytics
 }
