#!/bin/bash

exts=".aux .lof .log .lot .fls .out .toc .dvi .bbl .bcf .blg -blx.aux -blx.bib -blx.bib .run.xml .fdb_latexmk .synctex.gz .syntex.gz(busy) .pdfsync .algorithms .alg .loa .thm .nav .snm .vrb .acn .acr .glg .glo .gls .brf .lol .idx .ilg .ind .ist .maf .mtc .mtc0 .pyg .nlo .tdo .xdy .keys"

for x in "${@:-.}"; do
    arg=$(echo ${x:-.} | perl -pe 's/\.(tex|pdf)$//')

    if [[ -d "$arg" ]]; then
        for ext in $exts; do
             rm -f "$arg"/*$ext
        done
    else
        for ext in $exts; do
             rm -f "$arg"$ext
        done
    fi
done

rm -rf $(biber --cache)  # gross biber bug
