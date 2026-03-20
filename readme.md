## How to use thesis template

```sh
# copy thesis to the local template typst
mkdir -p ~/.cache/typst/packages/local
cp -r ./thesis ~/.cache/typst/packages/local/

# test it by compiling a pdf (the @local/local would fail
# if thesis not at the correct place)
typst c report.typ
```
