rm -r bin/
coffee --compile --output bin/ src/
#for file in src/*.test.coffee; do coffee $file; done;
#node bin/Scheme.test.js
node bin/index.js
