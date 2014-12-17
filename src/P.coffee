_ = require "lodash"

reduce = (f) ->
	(args, P) ->
		args = P.getJS args
		_.reduce args, f

# Define a function from E^k to E
# E is type
EkE = (name, type, fun) ->
	r = {}
	r["(#{name} a b ...)"] =
		parameter:
			"...": type
		return: type

		fun: reduce fun
	r
