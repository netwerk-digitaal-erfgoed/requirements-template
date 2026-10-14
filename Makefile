# The build comes from netwerk-digitaal-erfgoed/workflows, at the version that
# this spec’s workflows pin for spec.yml, so a local build matches CI.
NDE_WORKFLOWS_DIR ?= .github/workflows
NDE_REF := $(shell sed -n -E 's,.*netwerk-digitaal-erfgoed/workflows/(\.github/workflows/spec\.yml|spec-boilerplate)@([^[:space:]]+).*,\2,p' $(NDE_WORKFLOWS_DIR)/*.yml | head -n 1)
$(if $(NDE_REF),,$(error No spec.yml or spec-boilerplate version found in $(NDE_WORKFLOWS_DIR)))
NDE_DIR := .nde/$(NDE_REF)
NDE_MK := $(NDE_DIR)/spec-boilerplate/nde.mk

include $(NDE_MK)

$(NDE_MK):
	mkdir -p $(NDE_DIR)
	curl -fsSL https://github.com/netwerk-digitaal-erfgoed/workflows/archive/$(NDE_REF).tar.gz | tar -xz -C $(NDE_DIR) --strip-components=1
	npm ci --prefix $(NDE_DIR)/spec-boilerplate --no-audit --no-fund
