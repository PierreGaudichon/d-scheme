module.exports =

	desc: "Return the char at the specified index."

	test:
		"(string-charAt \"foo\" 0)": "#\\f"
		"(string-charAt \"foo\" -1)": "nil"
		"(string-charAt \"foo\" 3)": "nil"

	ways: ({String, Char, Integer, Nil}) ->
		"(string-charAt string index)":
			parameters:
				0: String
				1: Integer
			return: Char
			resolve: true

			fun: (ret, [s, i], P) ->
				s = s.toJS()
				i = i.toJS()
				unless 0 <= i < s.length-2
					return new Nil()
				ret.init "#\\" + s[i+1]
