#!/usr/bin/env bash

sleep 10

RUNS=$(gh run list --limit 100 --json databaseId,status,conclusion --jq '.[] | select(.status == "in_progress" or .status == "queued") | .databaseId')

if [ -z "$RUNS" ]; then
    echo "No jobs are currently running."
    exit 0
fi

echo "Waiting for the following jobs to finish: $RUNS"

for RUN_ID in $RUNS; do
    echo "Monitoring job $RUN_ID ..."
    gh run watch "$RUN_ID" --exit-status
    RUN_EXIT_CODE=$?
    if [ $RUN_EXIT_CODE -ne 0 ]; then
        echo "Job $RUN_ID failed. Exiting script."
        exit 1
    else
        echo "Job $RUN_ID succeeded."
    fi
done

echo "All jobs have succeeded."
exit 0