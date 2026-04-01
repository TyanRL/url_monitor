#!/bin/sh

URLS_FILE="/app/urls.txt"

echo "monitor started"

while true; do
  echo "===== $(date) ====="

  while IFS= read -r url || [ -n "$url" ]; do
    [ -z "$url" ] && continue

    code=$(curl -k -s -o /dev/null -w "%{http_code}" --max-time 15 "$url")
    rc=$?

    if [ "$rc" -eq 0 ]; then
      echo "[OK]   $url -> HTTP $code"
    else
      echo "[FAIL] $url -> curl_exit=$rc"
    fi
  done < "$URLS_FILE"

  sleep 50
done