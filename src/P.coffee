{Context} = require "./Context"
{CustomError} = require "./CustomError"

module.exports.P =
class P

	context: "Context"
	errors: "Error"

	constructor: (r) ->
		@context = new Context
		@errors = new CustomError r
		@std

	getJS: (expressions) ->
		for exp in expressions
			exp.resolve(@).toJS()

	error: (msg, data) ->
		@errors.log msg, data


