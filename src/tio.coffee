{isEqual} = require "lodash"

module.exports = (t, f) ->
	(n, {i, o}) ->
		name = ""
		fi = f i
		ok = isEqual fi, o

		console.log "#{if ok then "(ok)"else "(!)"} #{t}::#{n}"
		unless ok
			console.log "		calculated : #{JSON.stringify fi}"
			console.log "		expected   : #{JSON.stringify o}"
