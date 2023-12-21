#!/bin/sh -l
API_URL="https://agent.api.stepsecurity.io/v1/github/$GITHUB_REPOSITORY/actions/subscription"

# Set a timeout for the curl command (3 seconds)
RESPONSE=$(curl --max-time 3 -s -w "%{http_code}" "$API_URL" -o /dev/null) || true
CURL_EXIT_CODE=${?}

# Check if the response code is not 200
if [ $CURL_EXIT_CODE -ne 0 ] || [ "$RESPONSE" != "200" ]; then
    if [ -z "$RESPONSE" ] || [ "$RESPONSE" == "000" ] || [ $CURL_EXIT_CODE -ne 0 ]; then
    echo "Timeout or API not reachable. Continuing to next step."
    else
    echo "Subscription is not valid. Reach out to support@stepsecurity.io"
    exit 1
    fi
fi
PACKAGE_JSON_PATH="${1-.}"
echo "Reading package.json from ${PACKAGE_JSON_PATH}/package.json"
PACKAGE_VERSION=$(cat ${PACKAGE_JSON_PATH}/package.json | jq '.version' | tr -d '"')

echo "current-version=${PACKAGE_VERSION}" >> $GITHUB_OUTPUT
