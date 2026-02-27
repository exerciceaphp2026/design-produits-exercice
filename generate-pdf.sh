#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DELIVERABLES="$SCRIPT_DIR/deliverables"
OUTPUT="$DELIVERABLES/exercice-delivery-manager-aphp-final.pdf"

# Temp files
PART1="$DELIVERABLES/_tmp_portrait.md"
PART2="$DELIVERABLES/_tmp_landscape.md"
PDF1="$DELIVERABLES/_tmp_portrait.pdf"
PDF2="$DELIVERABLES/_tmp_landscape.pdf"

cleanup() {
  rm -f "$PART1" "$PART2" "$PDF1" "$PDF2"
}
trap cleanup EXIT

# Check output file is writable before starting
if [ -f "$OUTPUT" ] && ! rm -f "$OUTPUT" 2>/dev/null; then
  echo "Erreur : $OUTPUT est ouvert dans un autre programme. Fermez-le et relancez." >&2
  exit 1
fi

HEADER='<div style="font-size:8px; width:100%; text-align:right; margin-right:20mm; color:#888;">Exercice Delivery Manager - APHP / DSN</div>'
FOOTER='<div style="font-size:8px; width:100%; text-align:center; color:#888;"><span class="pageNumber"></span> / <span class="totalPages"></span></div>'

PAGE_BREAK=$'\n\n<div style="page-break-before: always;"></div>\n\n'

# --- Part 1: Portrait (intro + Q1-Q7) ---
cat > "$PART1" <<YAMLEOF
---
pdf_options:
  format: A4
  margin: 20mm
  headerTemplate: '${HEADER}'
  footerTemplate: '${FOOTER}'
  displayHeaderFooter: true
---

YAMLEOF

# Intro from README (title + hypotheses, stop before "---" after hypotheses)
sed -n '1,/^---$/p' "$SCRIPT_DIR/README.md" >> "$PART1"

# Q1 to Q7
for i in 01 02 03 04 05 06 07; do
  FILE=$(ls "$DELIVERABLES"/${i}-*.md 2>/dev/null | head -1)
  echo "$PAGE_BREAK" >> "$PART1"
  cat "$FILE" >> "$PART1"
done

# --- Part 2: Landscape (Q8) ---
cat > "$PART2" <<YAMLEOF
---
pdf_options:
  format: A4
  landscape: true
  margin: 20mm
  headerTemplate: '${HEADER}'
  footerTemplate: '${FOOTER}'
  displayHeaderFooter: true
---

YAMLEOF

# Copy Q8 and replace mermaid block with GANTT.png image
sed '/^```mermaid$/,/^```$/c\![Roadmap 6 mois - Grandes etapes](../inputs/GANTT.png)' "$DELIVERABLES"/08-roadmap-gantt.md >> "$PART2"

# Generate both PDFs
npx --yes md-to-pdf "$PART1" 2>/dev/null
npx --yes md-to-pdf "$PART2" 2>/dev/null

# Merge with pypdf
python3 - "$PDF1" "$PDF2" "$OUTPUT" <<'PYEOF'
import sys
from pypdf import PdfReader, PdfWriter

writer = PdfWriter()
for path in sys.argv[1:3]:
    reader = PdfReader(path)
    for page in reader.pages:
        writer.add_page(page)

with open(sys.argv[3], "wb") as f:
    writer.write(f)
PYEOF

echo "PDF genere : $OUTPUT"
