#!/usr/bin/env bash
set -euo pipefail

# Paths
SRC_DIR="$(pwd)"
OUT_DIR="$SRC_DIR/../html"
OUTPUT_FILE="$OUT_DIR/Main.html"

# Ensure output dir exists
mkdir -p "$OUT_DIR"

echo "📄 Generating HTML..."
asciidoctor -D "$OUT_DIR" "$SRC_DIR/Main.adoc"

echo "✅ Injecting collapsible ToC JavaScript..."

# Temporary file
TMP_FILE="$(mktemp)"

awk '
/<\/body>/ {
  print "<script>"
  print "document.addEventListener(\"DOMContentLoaded\", function () {"
  print "  const toc = document.getElementById(\"toc\");"
  print "  if (!toc) return;"
  print ""
  print "  const nested = toc.querySelectorAll(\"ul ul\");"
  print "  nested.forEach(ul => {"
  print "    ul.style.display = \"none\";"
  print "    const parentLi = ul.parentElement;"
  print "    const toggle = document.createElement(\"span\");"
  print "    toggle.textContent = \" ▶\";"
  print "    toggle.style.cursor = \"pointer\";"
  print "    toggle.style.color = \"gray\";"
  print "    toggle.style.marginLeft = \"4px\";"
  print ""
  print "    toggle.onclick = () => {"
  print "      const open = ul.style.display === \"block\";"
  print "      ul.style.display = open ? \"none\" : \"block\";"
  print "      toggle.textContent = open ? \" ▶\" : \" ▼\";"
  print "    };"
  print ""
  print "    const a = parentLi.querySelector(\"a\");"
  print "    if (a) a.after(toggle);"
  print "  });"
  print "});"
  print "</script>"
}
{ print }
' "$OUTPUT_FILE" > "$TMP_FILE"

mv "$TMP_FILE" "$OUTPUT_FILE"

echo "✅ Done! Open the file:"
echo "   open \"$OUTPUT_FILE\""
