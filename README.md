Organisation
------------

### Parser

String (scheme programm) -> List of Lexems

### Lexer

List of Lexems -> Expression

### Interpreter

Expression -> Value

Types
-----

 - Integer
 - Real
 - Boolean
 - Function
 - Variable
 - Unset

Classes
-------

### Context

 - [[Atom]] stack
 - [Atom] topLevel
 - {name: Atom} getAll([String] names)
 - Atom getOne(String name)

### Lexem

 - type
 - number
 - position
 - value

types: {open, close, atom}

### Expression

### Molecul

 - open
 - list
 - close
 - value
 - evaluated

### Atom

 - lexem
 - value
 - evaluated
 - type

