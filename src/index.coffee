{isEqual, where} = require "lodash"
{Scheme} = require "./Scheme"


programm = new Scheme()
res = programm
	.std "bin/std/*"
	.test()
	.out "tests", format: "raw"

#console.log res
console.log where res, {ok: false}

