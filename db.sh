echo "PGPASSWORD size: " ${#PGPASSWORD}

function create-uat-db-tunnel() {
  ssh -f -N -T -M -A uat-db-tunnel
}

function destroy-uat-db-tunnel() {
  ssh -T -O "exit" uat-db-tunnel
}

function psql-uat-puma-analytics() {
  create-uat-db-tunnel
  psql -h localhost -p 9001 -U puma_analytics
 }
