{SFunction} = require "./SFunction"
{Nil} = require "./Nil"
{cl} = require "./../cl"


module.exports.StandardFunction =
class StandardFunction extends SFunction

	ways: {}

	isSpecial: false
	specialRegex: /0/
	specialName: ""


	init: (@name, @ways) ->
		@isSpecial = false
		@


	special: (reg) ->
		@isSpecial = true
		@specialRegex = reg
		return @


	evaluate: (args, P) ->
		#console.log "StandardFunction#evaluate##{@name}"
		#cl args

		# We iterate through all the possible ways of calling that function.
		# "(lambda (x) x) : {parameters, return, fun}"
		for doc, way of @ways
			ok = true
			params = []

			# We resolve all parameters if necessary.
			#console.log way.resolve
			if way.resolve
				args = (arg.attach(@context).resolve P for arg in args)

			# We check that for each arg there is a corresponding type in
			# way.parameter.
			for arg, i in args
				# If there is a parameter with that index
				if way.parameters[i]?
					params.push {got: arg, expected: way.parameters[i]}
				# If there is the "..." parameter
				else if way.parameters["..."]?
					params.push {got: arg, expected: way.parameters["..."]}
				else
					ok = false

			# Now, we check if there are no more arguments than intended.
			if way.parameters[args.length]?
				ok = false

			# And we check if all parametes match the function definition
			for {got, expected} in params
				unless P.Type.isInstanceof expected, got
					ok = false

			if ok
				args = (a.attach @context for a in args)
				ret = new way.return(@parent)
				ret.attach @context
				if @isSpecial
					ret = way.fun ret, @specialName, args, P
				else
					ret = way.fun ret, args, P
				return ret

		P.error "wrong arguments"
		return new Nil @parent


	toJSON: ->
		{exp: "StandardFunction", ways: (doc for doc, w of @ways)}

	toString: -> Object.keys(@ways)[0]
