#fs = require "fs"
glob = require "glob"
#async = require "async"
_ = require "lodash"
{basename} = require "path"


metaReq = (contener, callback) ->
	glob contener + "/*", (err, files) ->
		files = _ files
			.map (f) -> basename f, ".js"
			.filter()
			.map (f) -> "#{contener}[\"#{f}\"] = require \"#{contener}/#{f}\""
			.unshift "#{contener} = {}"
			.push "module.exports.#{contener} = #{contener}"
			.value()
		callback err, files


metaReq "Expressions", (err, files) ->
	if err then throw err
	#console.log files

metaReq "std", (err, files) ->
	if err then throw err
	console.log files
