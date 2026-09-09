#!/usr/bin/env bash
# Đẩy bản mới nhất lên link preview đã chia sẻ với team.
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROTOTYPES="${PROTOTYPES_DIR:-$HOME/Leah/prototypes}"

if [ ! -d "$PROTOTYPES" ]; then
  echo "Không thấy thư mục prototypes ở $PROTOTYPES"
  echo "Set biến PROTOTYPES_DIR trỏ đúng chỗ rồi chạy lại."
  exit 1
fi

cp "$HERE/index.html"         "$PROTOTYPES/orran.html"
cp "$HERE/read-the-room.html" "$PROTOTYPES/empathy-guess-the-person.html"
echo "✓ Đã copy 2 file sang $PROTOTYPES"

cd "$PROTOTYPES"
vercel deploy --prod --yes >/dev/null
echo "✓ App Orran   https://prototypes-eta-cyan.vercel.app/orran"
echo "✓ Game 3 lẻ   https://prototypes-eta-cyan.vercel.app/empathy-guess-the-person"
