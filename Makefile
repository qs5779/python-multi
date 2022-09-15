TAGS ?= qs5779/python-multi:edge

.PHONY: vars
vars:
	@echo TAGS IS $(TAGS)

# .PHONY: clean
# clean:
# 	rm -fr dist build wtftools.egg-info

# .PHONY: build
# build: clean
# 	python -m build --wheel

# .PHONY: install
# install:
# 	pip install dist/wtftools-$(VERSION)-py3-none-any.whl

# .PHONY: uninstall
# uninstall:
# 	pip uninstall -y wtftools

# .PHONY: reinstall
# reinstall: uninstall clean build install

.PHONY: test
test:
	@echo TAGS=$(TAGS)
	for tag in $(TAGS) ; do \
		docker pull $$tag ; \
		docker run --rm --tty \
  	--volume $(shell git rev-parse --show-toplevel):/var/code/ \
  	$$tag  python --version ; \
	done
