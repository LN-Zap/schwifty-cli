.PHONY: build test test-binary dist-linux dist-macos dist-windows

build:
	pyinstaller --clean --noconfirm schwifty.spec

test:
	@$(DEVENV_ROOT)/.venv/bin/python $(DEVENV_ROOT)/schwifty-cli/__main__.py "DE89370400440532013000" | jq '.'

test-binary:
	@$(DEVENV_ROOT)/dist/schwifty "DE89370400440532013000" | jq '.'

# Targets for building the binary distributions for different platforms.
dist-linux:
	docker run --rm -v "${PWD}:/src/" --env SPECFILE=./schwifty.spec batonogov/pyinstaller-linux
	mkdir dist/linux
	mv dist/schwifty dist/linux/schwifty

dist-macos:
	# docker run --rm -v "${PWD}:/src/" --env SPECFILE=./schwifty.spec batonogov/pyinstaller-osx
	pyinstaller --clean --noconfirm schwifty.spec
	mkdir dist/macos
	mv dist/schwifty dist/macos/schwifty

dist-windows:
	docker run --rm -v "${PWD}:/src/" --env SPECFILE=./schwifty.spec batonogov/pyinstaller-windows
	mkdir dist/windows
	mv dist/schwifty dist/windows/schwifty