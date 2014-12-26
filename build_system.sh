# Installation

## Generate the `src/metaExec.coffee` using the generator `bin/meta.js`.
node bin/meta.js

## Delete the compiled folder to avoid garbage.
rm -r bin/

## Compile all files under `src/` into `bin/`.
## The `src/metaExec.coffee` to.
coffee --compile --output bin/ src/

## Browserify all the files.
## Takes time (~ 2sec)
## Do not use.
# browserify bin/Scheme.js -o public/bundle.js

## Create the dscheme executable.
mv bin/cli.js bin/dscheme
## Add the bang at the beginning ot the executable.
sed -i "1i #!/usr/bin/env node" bin/dscheme
## Finally, make it executable.
chmod +x bin/dscheme




# Documentation

## Generate the doc using the internal generator, see `src/reporter.coffee`
bin/dscheme -d -o doc/std-doc.md


# Tests

## Should output only oks.
#for file in src/*.test.coffee; do coffee $file; done;
#node bin/Scheme.test.js

## Should output only an empty list : `[]`.
#node bin/index.js

## Should output some Scheme.
#for file in test/*.scm; do bin/dscheme -i $file; done;
