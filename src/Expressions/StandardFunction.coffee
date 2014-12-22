{Function} = require "./Function"
{Type} = require "./../Type"
{Atom} = require "./Atom"
{Expression} = require "./Expression"


module.exports.StandardFunction =
class StandardFunction extends Function

	parameters: []
	return: ""
	fun: ->

	constructor: (@ways) ->


	evaluate: (args, P) ->
		# "(lambda (x) x) : {parameters, return, fun}"
		for doc, way of @ways
			console.log doc
			# parameters: {0: "Variable", "...": "Expression"}
			ok = true
			params = []


			for arg, i in args
				if way.parameters[i]?
					params.push {got: arg, expected: way.parameters[i]}
				else if way.parameters["..."]?
					params.push {got: arg, expected: way.parameters["..."]}
				else
					ok = false
					P.error "wrong arguments"

			for {got, expected} in params
				unless Type.isInstanceof expected, got.type
					ok = false
					P.error "wrong arguments"

			if ok
				executed = way.fun args, P
				if executed instanceof Expression
					return executed
				return new Atom way.return, executed





