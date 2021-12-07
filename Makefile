INSTALL_ARGS := $(if $(PREFIX),--prefix $(PREFIX),)

.PHONY: build rebuild buildv install uninstall utop repl clean all

build:
	dune build --profile release @install @runtest

buildv:
	dune build --verbose @install

install:
	dune install $(INSTALL_ARGS)

uninstall:
	dune uninstall $(INSTALL_ARGS)

utop:
	dune utop --profile release src/lib

repl: build
	./_build/default/src/bin/utop/main.bc

clean:
	dune clean

