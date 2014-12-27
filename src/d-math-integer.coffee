{isString, isNumber} = require "lodash"




class dNumber

	constructor: (v) -> @
	fromString: (v) -> @
	fromNumber: (v) -> @
	fromArray: (v) -> @

	toNumber: -> Number
	toString: -> String
	toJSON: -> Number

	@add: ([dNumber]) -> dNumber
	@multiply: ([dNumber]) -> dNumber
	@minus: (dNumber) -> dNumber
	@divide: (dNumberA, dNumberB) -> dNumber




class dInteger extends dNumber

	# All the numbers, unity are first
	# 478 == [8,7,4]
	all: []


	constructor: (v) ->
		@all = []
		if isString v
			@fromString v
		else if isNumber v
			@fromNumber v
		else
			throw new Error "not a string or number."


	fromString: (v) ->
	fromNumber: (v) ->
		@all = (parseInt a, 10 for a in v.toString().split("").reverse())
	fromArray: (v) ->
	fromDInteger: (v) ->

	toNumber: ->
		parseInt @all.reverse().join(""), 10
	toString: ->
	toJSON: -> @toNumber()


	# [dInteger] -> dInteger
	@add: (args) ->
		ret = new dInteger 0
		for a in args
			diff = 0
			for kieme, i in a.all
				console.log i
				retieme = ret.all[i]
				unless retieme
					retieme = kieme
				else
					retieme += kieme
				retieme += diff
				diff = 0
				if Math.floor(retieme/10) isnt 0
					diff = Math.floor(retieme/10)*10
					retieme = retieme-diff
				ret.all[i] = retieme
		return ret



## tests

a = new dInteger 852
b = new dInteger 498

console.log dInteger.add([a, b]).toNumber()
