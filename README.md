
D-Scheme
========


TODO
----

 - `Exceptions`, serait utile pour sqrt

 - Comments

 - Proper debugging
   - store line number for errors
   - display error position as Node or Coffee



Dont use console.log in print
Better output. Par defaut, pas d'output. Si print ou > en début de ligne, on affiche.

	(* 2 3)
	;; => rien, meme pas de ligne blanche
	> (* 2 3)
	;; > 6
	(* 2 (print 3))
	;; > 3
	> (* 2 (print 3))
	;; > 3
	;; > 6


Make it tail recursive.


 Deal with the floating number precision.
