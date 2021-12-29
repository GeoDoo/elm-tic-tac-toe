#!/bin/sh

set -e

js="elm.js"
min="elm.min.js"
build="build/"

rm -rf build

elm make --optimize --output=$build$js $@

uglifyjs $build$js --compress "pure_funcs=[F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9],pure_getters,keep_fargs=false,unsafe_comps,unsafe" | uglifyjs --mangle --output $build$min

echo "Initial size: $(cat $build$js | wc -c) bytes  ($build$js)"
echo "Minified size: $(cat $build$min | wc -c) bytes  ($build$min)"
echo "Gzipped size: $(cat $build$min | gzip -c | wc -c) bytes"