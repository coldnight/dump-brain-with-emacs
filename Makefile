MAKE_ := $(MAKE) -j1 --no-print-directory

DB_LISP_DIR = $(shell pwd)/lisp

EMACS ?= emacs
FUNC =

.PHONY: emacs-batch md

emacs-batch:
	@echo ""
	@echo "$(ORG_FILE) ::"
	@env HOME=$(shell pwd)/ $(EMACS) -l $(shell pwd)/.emacs.d/init.el --batch \
		--eval "(load-file (expand-file-name \"generate-hugo-md.el\" \"$(DB_LISP_DIR)\"))" \
		-f $(FUNC) \
		--kill

init:
	@$(MAKE_) emacs-batch FUNC=emacs-version

md: init
	@$(MAKE_) emacs-batch FUNC=generate-readme-to-hugo
