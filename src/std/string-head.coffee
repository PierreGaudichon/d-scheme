module.exports =

	desc: "Return the char at the beginning of the string."

	test:
		"(string-head \"foo\")": "#\\f"
		"(string-head \"bar\")": "#\\b"
		"(string-head \"\")": "nil"
		"(string-head nil)": "nil"

	ways: ({String, Char, Nil}) ->
		"(string-head string)":
			parameters:
				0: String
			return: Char
			resolve: true

			fun: (ret, [s], P) ->
				s = s.toJS()
				if s.length <= 2
					return new Nil()
				ret.init "#\\" + s[1]
