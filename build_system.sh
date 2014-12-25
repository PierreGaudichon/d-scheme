# Installation

rm -r bin/
coffee --compile --output bin/ src/
mv bin/cli.js bin/dscheme
sed -i "1i #!/usr/bin/env node" bin/dscheme
chmod +x bin/dscheme


# Documentation

bin/dscheme -d -o doc/std-doc.md


# Tests

# Should output only oks.
#for file in src/*.test.coffee; do coffee $file; done;
#node bin/Scheme.test.js

# Should output only an empty list : `[]`.
#node bin/index.js

# Should output 4 lines, the last is a `6`.
#bin/dscheme -i test/test.scm


node bin/meta.js
