MAIN_SRC=main
USE_DOCKER?=yes
DOCKER_IMAGE=maillein/ubuntu-texlive-ja

# TeX sources
STY_SRCS=$(wildcard ./*.sty)
BIB_SRCS=$(wildcard ./*.bst) $(wildcard ./*.bib)
TEX_SRCS=$(wildcard ./*.tex) $(wildcard */*.tex)

# Figures
FIG_DIR=figures
FIG_PNG=$(wildcard $(FIG_DIR)/*.png)
FIG_JPG=$(wildcard $(FIG_DIR)/*.jpg) $(wildcard $(FIG_DIR)/*.JPG) $(wildcard $(FIG_DIR)/*.jpeg)
FIG_EPS=$(wildcard $(FIG_DIR)/*.eps)
FIG_PDF=$(wildcard $(FIG_DIR)/*.pdf)
FIGS=$(FIG_PNG) $(FIG_JPG) $(FIG_EPS) $(FIG_PDF)

UIDOPT=-u $(shell id -u):$(shell id -g)
CURDIR=$(shell pwd)
DOCKER_CMD=docker run --rm $(UIDOPT) -v $(CURDIR):/workdir $(DOCKER_IMAGE)

LATEXMK_CMD=$(DOCKER_CMD) latexmk
WATCH_OPTION=-pvc -view=none

.DEFAULT_GOAL := pdf

.PHONY: pdf
pdf: $(MAIN_SRC).pdf

$(MAIN_SRC).pdf: $(TEX_SRCS) $(STY_SRCS) $(BIB_SRCS) $(FIGS)
	$(LATEXMK_CMD)

target=$(MAIN_SRC).tex
.PHONY: watch
watch:
	$(LATEXMK_CMD) $(WATCH_OPTION) $(target)

.PHONY: clean
clean:
	$(LATEXMK_CMD) -C $(TEX_SRCS)
