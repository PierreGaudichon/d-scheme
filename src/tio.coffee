{isEqual} = require "lodash"

module.exports.tio = (t, f) ->
	(n, {i, o}) ->
		name = ""
		fi = f i
		ok = isEqual fi, o

		console.log "#{if ok then "(ok)"else "(!)"} #{t}::#{n}"
		unless ok
			console.log "		calculated : #{JSON.stringify fi}"
			console.log "		expected   : #{JSON.stringify o}"


module.exports.regex = (reg, tests) ->
	for test, result of tests
		log = if result is reg.test test then "ok" else "!"
		log = "(#{log}) #{reg}::#{test}"
		console.log log
	return reg
