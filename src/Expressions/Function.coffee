{Expression} = require "./Expression"

module.exports.Function =
class Function extends Expression

	type: "Function"

	toString: -> "[Function]"
