{Function} = require "./Function"
{Type} = require "./../Type"

module.exports.CustomFunction =
class CustomFunction extends Function

	# A list of Strings representing the names of the parameters
	parameters: []
	# the body of the function, will be resolved when we have the arguments
	# ready
	body: "Expression"


	constructor: (params, body) ->
		@parameters = params
		@body = body


	evaluate: (args, P) ->
		# create the hash of Expressions to add to the context
		a = {}
		for param, i in @parameters
			a[param] = args[i]
		# Add the new variables to the context, by adding a new level to
		# the context
		P.context.push a
		# get the value of the function
		ret = @body.resolve P
		# remove the layer we just added to the context
		P.context.pop()
		return ret





