#!/bin/bash

rm ./templates/chatbot-templates/bot-src.zip

cd ./templates/chatbot-templates/
zip -r bot-src.zip .

aws s3 cp bot-src.zip s3://mrbbucket/chatbot/bot-src.zip

cd ..
aws cloudformation deploy --template-file bot-lex.yaml --stack-name mchatbot --capabilities CAPABILITY_IAM

