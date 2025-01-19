#!/bin/bash

JENKINS_URL="http://localhost:8080/"
JOB_NAME="myTest"
USERNAME="mosa"
API_TOKEN="11f3f2c7d3ae9c6b67ead8cdf2e726ce2f"
JOB_TOKEN="amidstoken567"

COMMIT_MSG="${1:-script commit}"

git add .
git commit -m "$COMMIT_MSG"
if git push origin "$(git rev-parse --abbrev-ref HEAD)"; then
    echo "Push successful"
else
    echo "Push failed. Pulling changes..."
    git pull --rebase
    if git push origin "$(git rev-parse --abbrev-ref HEAD)"; then
        echo "Changes pushed after pulling"
    else
        echo "Failed to push changes after pulling"
        exit 1
    fi
fi

curl -X POST "${JENKINS_URL}/job/${JOB_NAME}/build?token=${JOB_TOKEN}" \
     --user "${USERNAME}:${API_TOKEN}"

echo "Jenkins build triggered."