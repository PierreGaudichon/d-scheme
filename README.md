
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
 
 ## Error during installation
 
	[pierre@localhost d-scheme-2]$ npm i git://github.com/PierreGaudichon/d-scheme.git
	npm ERR! Linux 3.17.7-200.fc20.x86_64
	npm ERR! argv "node" "/usr/bin/npm" "i" "h" "git://github.com/PierreGaudichon/d-scheme.git"
	npm ERR! node v0.10.33
	npm ERR! npm  v2.1.12
	npm ERR! path ../d-scheme/out/dscheme
	npm ERR! code EACCES
	npm ERR! errno 3
	
	npm ERR! Error: EACCES, symlink '../d-scheme/out/dscheme'
	npm ERR!  { [Error: EACCES, symlink '../d-scheme/out/dscheme'] errno: 3, code: 'EACCES', path: '../d-scheme/out/dscheme' }
	npm ERR! 
	npm ERR! Please try running this command again as root/Administrator.
	
	npm ERR! Please include the following file with any support request:
	npm ERR!     /home/pierre/dev/d-scheme-2/npm-debug.log

