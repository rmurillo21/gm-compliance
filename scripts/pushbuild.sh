#!/bin/bash -e

# RJM 5/16/2020 push site to S3
# Usage: ./$0.sh 
# note: neeed to invalidate distribution after push

aws s3 sync ./build/site s3://hippa.docs.greenmarimba2.com/public