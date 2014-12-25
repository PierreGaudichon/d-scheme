module.exports =

	desc: "Create a list"

	test:
		"(list 1 2 3)": "(1 . (2 . (3 . nil)))"
		"((lambda (x) (list 1 2 x)) 3)": "(1 . (2 . (3 . nil)))"
		"(define foo (x) (cdr (list 1 2 3 x))) (foo 4)":
			"(lambda (x) (cdr (list 1 2 3 x)))\n(2 . (3 . (4 . nil)))"
		"(list)": "nil"


	ways: ({Expression, Pair, Nil}) ->
		"(list a b ...)":
			parameters:
				"...": Expression
			return: Pair
			resolve: true

			fun: (ret, [first, rest...], P) ->
				unless first?
					return new Nil ret.parent
				rest.reverse()
				a = new Nil null
				for el in rest
					b = new Pair null
					b.init el, a
					a.parent = b
					a = b
				ret.init first, a
				return ret


