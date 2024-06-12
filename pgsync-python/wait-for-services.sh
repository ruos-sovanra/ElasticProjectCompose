#!/bin/bash
set -e

#host1="$1"
#port1="$2"
host2="$3"
port2="$4"
shift 4
cmd="$@"

#until nc -z -v -w30 "$host1" "$port1"; do
#  >&2 echo "$host1:$port1 is unavailable - sleeping"
#  sleep 1
#done

until nc -z -v -w30 "$host2" "$port2"; do
  >&2 echo "$host2:$port2 is unavailable - sleeping"
  sleep 1
done

>&2 echo "Both services are up - executing command"
exec $cmd
