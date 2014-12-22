coffee --compile --output bin/ src/
#for file in src/*.test.coffee; do coffee $file; done;
node bin/scheme.test.js
node bin/index.js
