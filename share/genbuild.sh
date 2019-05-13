#!/bin/sh
if [ $# -gt 1 ]; then
    cd "$2"
fi
if [ $# -gt 0 ]; then
    FILE="$1"
    shift
    if [ -f "$FILE" ]; then
        INFO="$(head -n 1 "$FILE")"
    fi
else
    echo "Usage: $0 <filename> <srcroot>"
    exit 1
fi

DESC=""
SUFFIX=""
LAST_COMMIT_DATE=""
if [ -e "$(which git 2>/dev/null)" -a "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]; then
    git diff >/dev/null 2>/dev/null 

    DESC=$(git describe 2>/dev/null)
    RAWDESC=$(git describe --abbrev=0 2>/dev/null)
    git diff-index --quiet HEAD -- || DESC="v1.1"

    LAST_COMMIT_DATE="$(git log -n 1 --format="%ci")"
fi

if [ -n "$DESC" ]; then
    NEWINFO="#define BUILD_DESC \"$DESC\""
else
    NEWINFO="// No build information available"
fi

if [ "$INFO" != "$NEWINFO" ]; then
    echo "$NEWINFO" >"$FILE"
    if [ -n "$LAST_COMMIT_DATE" ]; then
        echo "#define BUILD_DATE \"$LAST_COMMIT_DATE\"" >> "$FILE"
    fi
fi
