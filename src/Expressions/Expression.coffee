module.exports.Expression =
class Expression

	resolve: (P) ->
		throw new Error "Expression#resolve : not supposed to be fired"

	evaluate: ->
		throw new Error "Expression#evaluate : not supposed to be fired"

	toString: ->
		throw new Error "Expression#toString : not supposed to be fired"

	toJS: ->
		throw new Error "Expression#toJS : not supposed to be fired"
