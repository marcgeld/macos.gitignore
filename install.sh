#!/bin/sh
set -eu

SOURCE_URL="https://raw.githubusercontent.com/marcgeld/macos.gitignore/refs/heads/main/.gitignore"
SOURCE_LABEL="marcgeld/macos.gitignore"
TARGET_FILE="${1:-.gitignore}"

if ! command -v curl >/dev/null 2>&1; then
    echo "Error: curl is required." >&2
    exit 1
fi

TMP_RULES="$(mktemp)"
TMP_OUT="$(mktemp)"
trap 'rm -f "$TMP_RULES" "$TMP_OUT"' EXIT HUP INT TERM

curl -fsSL "$SOURCE_URL" -o "$TMP_RULES"

touch "$TARGET_FILE"
cp "$TARGET_FILE" "$TMP_OUT"

# Ensure the existing file ends with a newline before appending.
if [ -s "$TMP_OUT" ] && [ "$(tail -c 1 "$TMP_OUT" | wc -l | tr -d ' ')" = "0" ]; then
    printf '\n' >> "$TMP_OUT"
fi

COMMENT="# Imported from $SOURCE_LABEL: $SOURCE_URL"

if ! grep -qxF "$COMMENT" "$TMP_OUT"; then
    printf '\n%s\n' "$COMMENT" >> "$TMP_OUT"
fi

while IFS= read -r line || [ -n "$line" ]; do
    if ! grep -qxF "$line" "$TMP_OUT"; then
        printf '%s\n' "$line" >> "$TMP_OUT"
    fi
done < "$TMP_RULES"

mv "$TMP_OUT" "$TARGET_FILE"
trap - EXIT HUP INT TERM
rm -f "$TMP_RULES"

echo "Updated $TARGET_FILE with unique rules from $SOURCE_LABEL."
