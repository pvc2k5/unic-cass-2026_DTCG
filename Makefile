PROJECT_DIR = $(shell pwd)
LIBRELANE_DIR ?= $(PROJECT_DIR)/librelane

.PHONY: all
all: librelane

.PHONY: smoke-test
smoke-test: 
	nix-shell --pure $(LIBRELANE_DIR) --run "PDK_ROOT=$(PDK_ROOT) PDK=$(PDK) librelane --smoke-test"

librelane: final/gds/$(TOP).gds
.PHONY: librelane

final/gds/$(TOP).gds: $(CFG_FILES)
	# Run librelane to generate the layout
	$(MAKE) -C user_project_example
