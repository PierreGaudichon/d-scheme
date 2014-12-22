tio = require "./tio"
{Type} = require "./Type"


t1 = tio "Type.tests.Integer", (i) ->
	Type.tests.Integer i

t1 "an Integer",
	i: "4"
	o: true

t1 "a Real",
	i: "4.2"
	o: false

t1 "a long integer",
	i: "4786513"
	o: true

t1 "a variable",
	i: "foo"
	o: false


t2 = tio "Type.tests.Real", (i) ->
	Type.tests.Real i

t2 "a Real",
	i: "4.2"
	o: true

t2 "a integer",
	i: "4"
	o: false

t2 "a variable",
	i: "foo"
	o: false

t2 "a long real",
	i: "42876.687431"
	o: true


t3 = tio "Type.tests.Boolean", (i) ->
	Type.tests.Boolean i

t3 "a boolean",
	i: "true"
	o: true

t3 "an another boolean",
	i: "#F"
	o: true

t3 "a variable",
	i: "foo"
	o: false
