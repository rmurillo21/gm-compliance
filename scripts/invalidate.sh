#!/bin/bash -e

# RJM 5/16/2020 invalidate the website
# Usage: ./invalidate.sh

distributiionId=E24ZH500XZP70Y

id=$(aws cloudfront create-invalidation --distribution-id $distributiionId --paths "/*" | jq -cr .Invalidation.Id)

echo Invalidation in progress
echo To check invalidation status, run 
echo aws cloudfront get-invalidation --id $id --distribution-id $distributiionId

status=$(aws cloudfront get-invalidation --id $id --distribution-id $distributiionId | jq -cr .Invalidation.Status)
echo status ${status}...

# wait till complete
while [[ "$status" != "Completed" ]]
do
   sleep 5
   echo status ${status}...
   status=$(aws cloudfront get-invalidation --id $id --distribution-id $distributiionId | jq -cr .Invalidation.Status)
done
