#!/bin/sh

aws configure set aws_access_key_id access_key_aws_local --profile default
aws configure set aws_secret_access_key secret_key_aws_local --profile default
aws configure set default.region us-east-1 --profile default

awslocal sqs create-queue --queue-name consent-testing-testing-external
awslocal sns create-topic --name consent-multi-tenant-testing
awslocal sns subscribe --topic-arn arn:aws:sns:us-east-1:000000000000:consent-multi-tenant-testing --protocol sqs --notification-endpoint http://localhost:4566/000000000000/consent-testing-testing-external
