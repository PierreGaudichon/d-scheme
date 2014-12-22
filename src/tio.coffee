{isEqual} = require "lodash"

module.exports = (t, f) ->
	(n, {i, o}) ->
		name = "Tio -> #{t}::#{n}"
		fi = f i
		if isEqual fi, o
			console.log "#{name} -> ok"
		else
			console.log "#{name} -> fail"
			console.log "	calculated : #{JSON.stringify fi}"
			console.log "	expected   : #{JSON.stringify o}"
