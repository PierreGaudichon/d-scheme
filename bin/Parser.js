// Generated by CoffeeScript 1.8.0
(function() {
  var Lexem, Parser,
    __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  Lexem = require("./Lexem").Lexem;

  module.exports.parse = function(str) {
    return new Parser(str).parse().out();
  };

  module.exports.Parser = Parser = (function() {
    Parser.prototype.string = "";

    Parser.prototype.list = [];

    Parser.prototype.buffer = "";

    Parser.prototype.position = {
      line: 0,
      column: 0
    };

    Parser.white = [" ", "\t", "\n"];

    Parser.lexemBreaker = ["(", ")"];

    Parser.lineBreaker = ["\n"];

    function Parser(str) {
      this.string = str;
      this.list = [];
      this.position = {
        line: 0,
        column: 0
      };
      this.buffer = "";
    }

    Parser.prototype.parse = function() {
      var char, _i, _len, _ref;
      _ref = this.string;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        char = _ref[_i];
        if (__indexOf.call(Parser.lexemBreaker, char) >= 0) {
          this.newLexem();
          this.buffer += char;
          this.newLexem();
        } else if (__indexOf.call(Parser.white, char) < 0) {
          this.buffer += char;
        } else {
          this.newLexem();
        }
        this.newChar(char);
      }
      return this;
    };

    Parser.prototype.newChar = function(c) {
      this.position.char++;
      if (__indexOf.call(Parser.lineBreaker, c) >= 0) {
        this.position.line++;
        this.position.column = 0;
      }
      return this;
    };

    Parser.prototype.newLexem = function() {
      if (this.buffer.length > 0) {
        this.addToList(this.buffer, this.position);
      }
      return this.buffer = "";
    };

    Parser.prototype.addToList = function(value, position) {
      var lexem, number;
      lexem = new Lexem(value);
      number = this.list.length;
      lexem.setPosition(number, position);
      this.list.push(lexem);
      return null;
    };

    Parser.prototype.out = function() {
      return this.list;
    };

    Parser.test = function() {
      var parser;
      parser = new Parser("(+ 4 2)");
      parser.addToList("(");
      parser.addToList("+");
      parser.addToList("4");
      parser.addToList("2");
      parser.addToList(")");
      return parser;
    };

    return Parser;

  })();

}).call(this);
