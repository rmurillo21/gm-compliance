#!/bin/bash -e

# RJM 5/16/2020 invalidate the website
# Usage: ./invalidate.sh E24ZH500XZP70Y

id=$(aws cloudfront create-invalidation --distribution-id $1 --paths "/*" | jq -cr .Invalidation.Id)

echo Invalidation in progress
echo To check invalidation status, run 
echo aws cloudfront get-invalidation --id $id --distribution-id $1

status=$(aws cloudfront get-invalidation --id $id --distribution-id $1 | jq -cr .Invalidation.Status)
echo status ${status}...

# wait till complete
while [[ "$status" != "Completed" ]]
do
   sleep 5
   echo status ${status}...
   status=$(aws cloudfront get-invalidation --id $id --distribution-id $1 | jq -cr .Invalidation.Status)
done
