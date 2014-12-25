
times = (char, n) ->
	r = ""
	r += char for i in [0...n] by 1
	return r

h1 = (str) ->
	str + "\n" + times("=", str.length) + "\n\n"

h2 = (str) ->
	times("#", 2) + " " + str + "\n\n"

h3 = (str) ->
	times("#", 3) + " " + str + "\n\n"

h4 = (str) ->
	times("#", 4) + " " + str + "\n\n"

p = (str) ->
	str += "\n\n"

li = (str) ->
	" - " + str + "\n"

icode = (str) ->
	"`" + str + "`"


module.exports.reporter =

	documentation: (all) ->
		out = h1 "Standard Library Documentation"
		out += p "This is the documentation generated from the standard library. The sources can be found under `src/std` and src/reporter.coffee. This file shouldn't be modified manually."
		for {name, desc, test, ways} in all
			out += h2 name
			out += p desc
			for doc, way of ways when doc not in ["type", "value"]
				out += li icode doc
			out += "\n"

			out += h3 "Examples"
			for t, r of test
				out += "\t#{t}\n"
				out += "\t\t;; => #{r}\n\n"

			out += "\n"

		return out

