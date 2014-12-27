{isEqual, where} = require "lodash"
{Scheme} = require "./Scheme"
{regex} = require "./tio"


programm = new Scheme()
res = programm
	.std "bin/std/*"
	.test()
	.out "tests", format: "raw"
	#.doc()
	#.out "documentation", format: "md"

#console.log res
console.log where res, {ok: false}


res = programm
	.in "str", "\"foo\""
	.parse()
	.lexe()
	.interprete()
	.out "computed", format: "raw"

#console.log res


console.log Number.MIN_VALUE


