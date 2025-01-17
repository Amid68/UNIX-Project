#!/bin/bash

JENKINS_URL="http://192.168.64.13:8080"
JOB_NAME="github-test"
USERNAME="amid"
API_TOKEN="117fbe11284ab511a3ab37f493fa440e8f"
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