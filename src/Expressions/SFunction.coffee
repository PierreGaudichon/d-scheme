{Atom} = require "./Atom"

module.exports.SFunction =
class SFunction extends Atom

	resolve: -> @

	toString: -> "[Function]"
