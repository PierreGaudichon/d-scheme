{SFunction} = require "./SFunction"
{Nil} = require "./Nil"
{cl} = require "../cl"


module.exports.CustomFunction =
class CustomFunction extends SFunction

	params: []
	body: "Expression"

	init: (@params, @body) -> @


	evaluate: (args, P) ->
		#console.log "CustomFunction#evaluate"
		# Check if the params array and the args array have the same length
		if @params.length isnt args.length
			#console.log "CustomFunction#evaluate :: length"
			P.error "wrong arguments"
			return new Nil()

		# Creates the hash of all arguments
		p = {}
		for param, i in @params
			p[param] = args[i].resolve P
		# Put thoses arguments into the body of the function
		@body.attach(@context).attach(p)
		# resolve that body
		return @body.resolve P

	toJSON: -> {exp: "CustomFunction", @params, body: @body.toJSON()}

	toString: -> "(lambda (#{@params.join " "}) #{@body.toString()})"

