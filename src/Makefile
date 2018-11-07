# environment variables
CONFIG_ENV := config/env.mk
include $(CONFIG_ENV)

SRC_DIR := src
WEBSITE_DIR := $(SRC_DIR)/website

install:
	@echo "[INFO] Installing loader npm dependencies"
	npm install

BUILD_TYPE ?= $()

build: config
	@echo "[INFO] Building loader"
	npm start

sync-website: create-iframe-snippet
    @echo "[INFO] copying website files"
    aws s3 sync --acl public-read \
        $(WEBSITE_DIR) s3://$(WEBAPP_BUCKET)
