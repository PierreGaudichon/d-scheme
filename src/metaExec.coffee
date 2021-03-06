# Auto generated, do not modify !

Expressions = {}
Expressions["Atom"] = require("./Expressions/Atom")["Atom"]
Expressions["Boolean"] = require("./Expressions/Boolean")["Boolean"]
Expressions["Char"] = require("./Expressions/Char")["Char"]
Expressions["CustomFunction"] = require("./Expressions/CustomFunction")["CustomFunction"]
Expressions["Expression"] = require("./Expressions/Expression")["Expression"]
Expressions["Integer"] = require("./Expressions/Integer")["Integer"]
Expressions["Molecule"] = require("./Expressions/Molecule")["Molecule"]
Expressions["Nil"] = require("./Expressions/Nil")["Nil"]
Expressions["Pair"] = require("./Expressions/Pair")["Pair"]
Expressions["Quote"] = require("./Expressions/Quote")["Quote"]
Expressions["Real"] = require("./Expressions/Real")["Real"]
Expressions["Root"] = require("./Expressions/Root")["Root"]
Expressions["SFunction"] = require("./Expressions/SFunction")["SFunction"]
Expressions["StandardFunction"] = require("./Expressions/StandardFunction")["StandardFunction"]
Expressions["String"] = require("./Expressions/String")["String"]
Expressions["Value"] = require("./Expressions/Value")["Value"]
Expressions["Variable"] = require("./Expressions/Variable")["Variable"]
module.exports.Expressions = Expressions

std = {}
std["*"] = require("./std/*")
std["+"] = require("./std/+")
std["-"] = require("./std/-")
std["="] = require("./std/=")
std["and"] = require("./std/and")
std["boolean?"] = require("./std/boolean?")
std["cadr"] = require("./std/cadr")
std["car"] = require("./std/car")
std["cdr"] = require("./std/cdr")
std["char?"] = require("./std/char?")
std["cond"] = require("./std/cond")
std["cons"] = require("./std/cons")
std["const"] = require("./std/const")
std["cos"] = require("./std/cos")
std["define"] = require("./std/define")
std["id"] = require("./std/id")
std["if"] = require("./std/if")
std["integer?"] = require("./std/integer?")
std["lambda"] = require("./std/lambda")
std["let"] = require("./std/let")
std["list"] = require("./std/list")
std["list?"] = require("./std/list?")
std["nil?"] = require("./std/nil?")
std["not"] = require("./std/not")
std["or"] = require("./std/or")
std["pair?"] = require("./std/pair?")
std["pi"] = require("./std/pi")
std["print"] = require("./std/print")
std["quote"] = require("./std/quote")
std["real?"] = require("./std/real?")
std["sin"] = require("./std/sin")
std["slash"] = require("./std/slash")
std["sqrt"] = require("./std/sqrt")
std["string-charAt"] = require("./std/string-charAt")
std["string-head"] = require("./std/string-head")
std["string-tail"] = require("./std/string-tail")
std["string?"] = require("./std/string?")
std["tan"] = require("./std/tan")
std["unquote"] = require("./std/unquote")
module.exports.std = std
