#!/bin/sh
cat data.yml private.yml > full.yml \
  && mustache full.yml cv.tex.mustache > cv.tex \
  && xelatex cv.tex
