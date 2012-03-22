#!/bin/sh
mkdir -p public
coffee -o public *.coffee
jade -O public *.jade
stylus -o public *.styl
