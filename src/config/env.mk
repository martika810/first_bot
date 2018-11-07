export BOOTSTRAP_BUCKET_PATH ?= aws-bigdata-blog/artifacts/aws-lex-web-ui/artifacts

# S3 bucket hosting the web application
# The Makefile in the root dir can sync the local files to it
export WEBAPP_BUCKET ?= $()

# AWS cli env variables used when running/building
# Override by setting it in the environment before running make
export AWS_DEFAULT_PROFILE ?= default
export AWS_DEFAULT_REGION ?= eu-west-1
