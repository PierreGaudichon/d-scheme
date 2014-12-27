fs = require "fs"
commander = require "commander"
{Scheme} = require "./../bin/Scheme"
{resolve} = require "path"


commander
	.version require("./../package.json").version
	.usage "[options] files"
	.option "-i --interprete", "Interprete the file."
	.option "-p --parse", "Parse the file."
	.option "-l --lexe", "Lexe the  file."
	.option "-o --out [file]", "Set the output file."
	.option "--documentation", "Create the documentation dor the standard library."
	.option "--cheatsheet", "Create the CheatSheet for the standard library."
	.parse process.argv


out = ""
programm = new Scheme()
programm.std "bin/std/*"

if commander.documentation
	out = programm.doc().out "documentation", format: "md"

if commander.cheatsheet
	out = programm.doc().out "cheatsheet", format: "md"
	console.log out

else if commander.args.length isnt 0
	for filePath in commander.args
		filePath = resolve filePath
		out = ";; d-scheme ;; #{filePath}\n"

		content = fs.readFileSync filePath, encoding: "utf-8"
		programm.in "str", content

		if commander.interprete
			out += programm.parse().lexe().interprete()
				.out "computed", format: "str"
		else if commander.lexe
			out += programm.parse().lexe().out "root", format: "str"

		else if commander.parse
			out += programm.parse().out "lexems", format: "str"

		out += "\n"

if commander.out
	fs.writeFile resolve(commander.out), out, (err) ->
		if err then throw err

else
	console.log out
