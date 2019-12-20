SHELL := bash

APP_PATH=$@
APP_PROJECT=$*

KUSTOMIZE=kustomize build --enable_alpha_plugins
KUSTOMIZE_PLUGIN_DIR=${HOME}/.config/kustomize/plugin/

.PHONY: links
links:
	mkdir -p ${KUSTOMIZE_PLUGIN_DIR}
	ln -sf $(shell pwd)/kustomize/plugin/cloudcover.coryodaniel.com ${KUSTOMIZE_PLUGIN_DIR}

.PHONY: test

test:
	${KUSTOMIZE} ./examples/base

.PHONY: examples/base
examples/base:
	${KUSTOMIZE} ./examples/base

apps/%:
	mkdir -p ${APP_PATH}
	mkdir -p ${APP_PATH}/base
	touch ${APP_PATH}/base/kustomization.yaml
	mkdir -p ${APP_PATH}/gcp
	touch ${APP_PATH}/gcp/kustomization.yaml
	mkdir -p ${APP_PATH}/aws
	touch ${APP_PATH}/aws/kustomization.yaml
