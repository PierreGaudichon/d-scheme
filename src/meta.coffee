fs = require "fs"
glob = require "glob"
async = require "async"
_ = require "lodash"
{basename} = require "path"


metaReq = (path, contener, opt, callback) ->
	glob "src/" + path + "/*", (err, files) ->
		req = _ files
			.map (f) -> basename f, ".coffee"
			.filter()
			.map (f) ->
				o = "#{contener}[\"#{f}\"] = require(\"./#{path}/#{f}\")"
				o += "[\"#{f}\"]" if opt.klass
				return o
			.unshift "#{contener} = {}"
			.push "module.exports.#{contener} = #{contener}"
			.join "\n"
			#.value()
		callback err, req + "\n"


async.waterfall [
	(callback) ->
		async.parallel [
			(callback) ->
				metaReq "Expressions", "Expressions", {klass: true}, callback
			(callback) ->
				metaReq "std", "std", {klass: false}, callback
		], (err, res) ->
			head = "# Auto generated, do not modify !\n\n"
			callback null, head + res.join "\n"
	(str, callback) ->
		fs.writeFile "./src/metaExec.coffee", str, callback
]
