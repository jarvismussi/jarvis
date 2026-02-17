#!/bin/bash
# Auto-push workspace changes to GitHub
cd /data/.openclaw/workspace

# Check for changes
if git diff --quiet && git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
    exit 0
fi

# Stage, commit, push
git add -A
TIMESTAMP=$(date -u +"%Y-%m-%d %H:%M UTC")
git commit -m "🔄 Auto-sync: $TIMESTAMP" --quiet
git push --quiet
