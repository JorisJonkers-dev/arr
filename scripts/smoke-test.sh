#!/usr/bin/env bash
# Starts every image restricted (uid 1000, a read-only root, every capability dropped), with its
# config and its media folders writable as deploy, and waits until each serves.
# Usage: scripts/smoke-test.sh <sonarr-image> <radarr-image> <bazarr-image>
set -euo pipefail
apps=("sonarr $1 8989 /ping" "radarr $2 7878 /ping" "bazarr $3 6767 /")

cleanup() { docker rm -f smoke-sonarr smoke-radarr smoke-bazarr >/dev/null 2>&1 || true; }
trap cleanup EXIT
cleanup

writable=(--tmpfs '/run:uid=1000,gid=1000,exec' --tmpfs '/tmp:uid=1000,gid=1000,mode=1777'
  --tmpfs '/config:uid=1000,gid=1000' --tmpfs '/media/Completed:uid=1000,gid=1000'
  --tmpfs '/media/Series:uid=1000,gid=1000' --tmpfs '/media/Films:uid=1000,gid=1000')
for spec in "${apps[@]}"; do
  read -r name image _ _ <<<"$spec"
  docker run -d --name "smoke-$name" --read-only --cap-drop ALL --security-opt no-new-privileges \
    "${writable[@]}" -e TZ=Europe/Amsterdam "$image" >/dev/null
done

for spec in "${apps[@]}"; do
  read -r name _ port path <<<"$spec"
  for _ in $(seq 1 60); do
    code=$(docker exec "smoke-$name" curl -s -o /dev/null -w '%{http_code}' "http://127.0.0.1:${port}${path}" 2>/dev/null || true)
    [ "$code" = 200 ] && break
    if [ "$(docker inspect -f '{{.State.Running}}' "smoke-$name")" != true ]; then
      docker logs "smoke-$name" 2>&1 | tail -30
      echo "$name exited before it served" >&2
      exit 1
    fi
    sleep 3
  done
  [ "$code" = 200 ] || { docker logs "smoke-$name" 2>&1 | tail -30; echo "$name never served $path" >&2; exit 1; }
  others=$(docker top "smoke-$name" -eo pid,uid | tail -n +2 | awk '$2 != 1000')
  [ -z "$others" ] || { echo "$name runs a process as another uid: $others" >&2; exit 1; }
  echo "$name serves $path as uid 1000"
done
echo "smoke test passed"
