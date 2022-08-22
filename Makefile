SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

ifeq ($(origin .RECIPEPREFIX), undefined)
  $(error This Make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later)
endif
.RECIPEPREFIX = >

build:  tmp/reloaded.sentinal
> @echo 'Done'
.PHONY: build

clean:
> rm -rf tmp
.PHONY: clean

tmp/reload.sentinal: $(shell  find . -wholename "*.service")
> @mkdir -p tmp
> @for i in $?; do \
> echo 'copy ' $$i '->' /etc/systemd/system/$$i;
> cp $$i /etc/systemd/system/$$i
> @done
> @touch tmp/reload.sentinal

tmp/reloaded.sentinal: tmp/reload.sentinal
> @echo 'daemon reload ' $@
> @systemctl daemon-reload
> @touch $@
