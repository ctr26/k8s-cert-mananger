#!make
include .env
include secrets.env
export
BASEDIR = $(shell pwd)
# SOURCE:=$(shell source secrets.env)
# include .secrets
deploy.prod:
	helmsman --apply --debug --group production-f helmsman.yaml -f helmsman/production.yaml
deploy.staging:
	helmsman --apply --debug --group production -f helmsman.yaml -f helmsman/production.yaml

cert-manager.deploy.prod.minikube:
	helmsman --apply --debug --target cert-manager -f helmsman.yaml -f helmsman/production.yaml -f helmsman/minikube.yaml --always-upgrade

cert-manager.deploy.prod:
	helmsman --apply --debug --target cert-manager -f helmsman.yaml -f helmsman/production.yaml --always-upgrade

