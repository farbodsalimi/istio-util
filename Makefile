.DEFAULT_GOAL := help
CURR_DIR=.

.PHONY: ingress-info
ingress-info: ## Print Ingress Information
	@echo "+ $@"
	$(SHELL) -c './bin/istio/ingress.sh get_ingress_info'

.PHONY: kiali
kiali: ## Open Kiali
	@echo "+ $@"
	$(SHELL) -c './bin/observability/kiali.sh proxy'

.PHONY: jaeger
jaeger: ## Open Jaeger
	@echo "+ $@"
	$(SHELL) -c './bin/observability/jaeger.sh proxy'

.PHONY: grafana
grafana: ## Open Grafana
	@echo "+ $@"
	$(SHELL) -c './bin/observability/grafana.sh proxy'

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'
