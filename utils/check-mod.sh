#!/bin/sh
# Syntax-check every WeiDU file in the mod (TP2 and TPA).
# Needs WeiDU in tools/weidu/ and the stub game folder in tools/stubgame/
# (both local only, ignored by git).
# Usage: utils/check-mod.sh

root="$(cd "$(dirname "$0")/.." && pwd)"
weidu="$root/tools/weidu/weidu"
game="$root/tools/stubgame"

if [ ! -x "$weidu" ]; then
  echo "WeiDU not found at $weidu" >&2
  exit 1
fi

cd "$root/mod" || exit 1
failed=0
for file in $(find halflingkits -name '*.tp2' -o -name '*.tpa' | sort); do
  case "$file" in
    *.tp2) type=TP2 ;;
    *) type=TPA ;;
  esac
  output="$("$weidu" --game "$game" --parse-check "$type" "$file" 2>&1)"
  if echo "$output" | grep -q "was successfully parsed"; then
    echo "OK    $file"
  else
    echo "FAIL  $file"
    echo "$output" | grep -v '^  -' | grep -v '^\[' | grep -v '^[[:space:]]*$' | sed 's/^/      /' | head -15
    failed=1
  fi
done
exit $failed
