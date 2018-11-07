#!/bin/bash

zip -r src.zip src
aws s3 cp src.zip s3://mrbbucket/chatbot/src.zip

cd ./templates/
aws s3 cp codebuild-deploy.yaml s3://mrbbucket/chatbot/templates/codebuild-deploy.yaml

aws cloudformation create-stack --template-url https://s3-eu-west-1.amazonaws.com/mrbbucket/chatbot/templates/codebuild-deploy.yaml --stack-name webchatbot --capabilities CAPABILITY_IAM

CREATE_COMMAND_OUTPUT=$?
if [ $CREATE_COMMAND_OUTPUT -eq 0 ]; then
  echo "Create a stack"
else
    aws cloudformation deploy --template-file codebuild-deploy.yaml --stack-name webchatbot --capabilities CAPABILITY_IAM
fi