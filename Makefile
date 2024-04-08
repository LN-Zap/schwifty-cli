.PHONY: build test

build:
	pyinstaller --clean --noconfirm schwifty.spec

test:
	@$(DEVENV_ROOT)/.venv/bin/python $(DEVENV_ROOT)/schwifty-cli/__main__.py "DE89370400440532013000" | jq '.'

test-binary:
	@$(DEVENV_ROOT)/dist/schwifty "DE89370400440532013000" | jq '.'