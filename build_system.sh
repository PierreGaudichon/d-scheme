# Installation

## Generate the `src/metaExec.coffee` using the generator `src/meta.coffee`.
coffee src/meta.coffee

## Delete the compiled folder to avoid garbage.
rm -rf bin/ doc/
mkdir bin doc

## Compile all files under `src/` into `bin/`.
## The `src/metaExec.coffee` to.
coffee --compile --output bin/ src/

## Browserify all the files.
## Takes time (~ 2sec)
## Do not use.
# browserify bin/Scheme.js -o public/bundle.js

## Create the dscheme executable.
cp bin/cli.js out/dscheme
## Add the bang at the beginning ot the executable.
sed -i "1i #!/usr/bin/env node" out/dscheme
## Finally, make it executable.
chmod +x out/dscheme

## Generate the doc using the internal generator, see `src/reporter.coffee`
out/dscheme --documentation -o doc/std-doc.md
out/dscheme --cheatsheet -o doc/cheatsheet.md


# Tests

## Should output only oks.
#for file in src/*.test.coffee; do coffee $file; done;
#node bin/Scheme.test.js

## Should output only an empty list : `[]`.
#node bin/index.js

## Should output some Scheme.
#for file in test/*.scm; do out/dscheme -i $file; done;
