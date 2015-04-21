#!/bin/sh
cat data.yml private.yml cover.yml > full_cover.yml \
  && mustache full_cover.yml cover.tex.mustache > cover.tex \
  && xelatex cover.tex
