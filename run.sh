if [ "$WERCKER_RESULT" = "passed" ]; then
   export WERCKER_GITHUB_BUILD_NOTIFY_STATE="{\"state\":\"success\",\"target_url\":\"$WERCKER_BUILD_URL\"}";
elif [ "$WERCKER_RESULT" = "failed" ]; then
   export WERCKER_GITHUB_BUILD_NOTIFY_STATE="{\"state\":\"failure\",\"target_url\":\"$WERCKER_BUILD_URL\"}";
else
   export WERCKER_GITHUB_BUILD_NOTIFY_STATE="{\"state\":\"pending\",\"target_url\":\"$WERCKER_BUILD_URL\"}";
fi

curl -H "Authorization: token $WERCKER_GITHUB_BUILD_NOTIFY_TOKEN" \
    -d $WERCKER_GITHUB_BUILD_NOTIFY_STATE \
    https://api.github.com/repos/$WERCKER_GIT_OWNER/$WERCKER_GIT_REPOSITORY/statuses/$WERCKER_GIT_COMMIT
