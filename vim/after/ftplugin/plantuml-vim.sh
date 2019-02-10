#!/bin/sh

set -e

plantuml -tsvg -verbose -failfast2 -o /tmp/plantuml-vim "$1"
mv "/tmp/plantuml-vim/$(basename "$2")" "$2"
