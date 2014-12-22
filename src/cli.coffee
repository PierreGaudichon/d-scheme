commander = require "commander"

commander
	.version require("package.json").version
	.option "-i --interprete", "Interprete the file."
	.option "-p --parse", "Parse the file."
	.option "-l --lexe", "Lexe the  file."
	.option "-o --out", "Set the output file (otherwise stdout)."
	.parse process.argv




