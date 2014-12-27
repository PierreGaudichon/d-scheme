module.exports =

	desc: "Return the end of the string, everything but the first char."

	test:
		"(string-tail \"foo\")": "\"oo\""
		"(string-tail \"bar\")": "\"ar\""
		"(string-tail \"\")": "nil"
		"(string-tail nil)": "nil"

	ways: ({String, Nil}) ->
		"(string-tail string)":
			parameters:
				0: String
			return: String
			resolve: true

			fun: (ret, [s], P) ->
				s = s.toJS()
				if s.length <= 2
					return new Nil()
				ret.init "\"" + s[2..]
