{Atom} = require "./Atom"

module.exports.Nil =
class Nil extends Atom

	init: -> @

	resolve: -> @

	toJS: -> null

	toString: -> "nil"

	toJSON: -> {exp: "Nil"}
