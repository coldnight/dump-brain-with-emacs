MAKE_ := $(MAKE) -j1 --no-print-directory

EMACS ?= emacs
FUNC =

.PHONY: emacs-batch md

emacs-batch:
	@echo ""
	@echo "$(ORG_FILE) ::"
	@mkdir $(shell pwd)/.cache
	@env HOME=$(shell pwd)/ $(EMACS) -l $(shell pwd)/.emacs.d/init.el --batch \
		--eval "(load-file (expand-file-name \"lisp/generate-hugo-md.el\" \"~\"))" \
		-f $(FUNC) \
		--kill

init:
	@$(MAKE_) emacs-batch FUNC=emacs-version

md: init
	@$(MAKE_) emacs-batch FUNC=generate-readme-to-hugo
