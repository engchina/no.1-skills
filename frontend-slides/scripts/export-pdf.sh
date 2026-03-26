#!/usr/bin/env bash
# ===========================================
# Export HTML slides to PDF using headless Chrome/Chromium
#
# Usage:
#   ./export-pdf.sh <input.html> [output.pdf]
#
# If output path is omitted, saves alongside the input file
# with a .pdf extension.
# ===========================================

set -euo pipefail

INPUT="${1:?Usage: export-pdf.sh <input.html> [output.pdf]}"
OUTPUT="${2:-${INPUT%.html}.pdf}"

# Auto-detect browser binary
detect_browser() {
    local candidates=(
        "google-chrome"
        "google-chrome-stable"
        "chromium"
        "chromium-browser"
        "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
        "/Applications/Chromium.app/Contents/MacOS/Chromium"
    )
    for bin in "${candidates[@]}"; do
        if command -v "$bin" &>/dev/null || [ -x "$bin" ]; then
            echo "$bin"
            return 0
        fi
    done
    return 1
}

BROWSER=$(detect_browser) || {
    echo "Error: No Chrome or Chromium found. Install one of:"
    echo "  - Google Chrome"
    echo "  - Chromium"
    exit 1
}

# Resolve to absolute path for file:// URL
INPUT_ABS="$(cd "$(dirname "$INPUT")" && pwd)/$(basename "$INPUT")"

echo "Exporting: $INPUT → $OUTPUT"
echo "Browser:   $BROWSER"

"$BROWSER" \
    --headless \
    --disable-gpu \
    --no-sandbox \
    --print-to-pdf="$OUTPUT" \
    --print-to-pdf-no-header \
    "file://${INPUT_ABS}"

if [ -f "$OUTPUT" ]; then
    echo "PDF saved: $OUTPUT ($(du -h "$OUTPUT" | cut -f1))"
else
    echo "Warning: PDF export failed. Delivering HTML only."
    exit 1
fi
