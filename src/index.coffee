{parse} = require "./Parser"
{lexe} = require "./Lexer"

console.log JSON.stringify lexe parse "(+ 4 2)"
console.log lexe(parse "(+ (* 4 2) 2)").toString()
