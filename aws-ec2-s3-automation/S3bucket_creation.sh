#!/bin/bash

BUCKET_NAME="my-s3-ec2-read-bucket-$(date +%s)"

if aws s3api create-bucket \
    --bucket "$BUCKET_NAME" \
    --region eu-north-1 \
    --create-bucket-configuration LocationConstraint=eu-north-1
then
    echo "✅ S3 bucket created: $BUCKET_NAME"
else
    echo "❌ Failed to create S3 bucket."
    exit 1
fi