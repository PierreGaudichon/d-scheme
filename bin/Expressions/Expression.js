// Generated by CoffeeScript 1.8.0
(function() {
  var Expression, Variable;

  Variable = require("./Variable").Variable;

  module.exports.Expression = Expression = (function() {
    function Expression() {}

    Expression.prototype.resolve = function(P) {
      throw new Error("Expression#resolve : not supposed to be fired");
    };

    Expression.prototype.evaluate = function() {
      throw new Error("Expression#evaluate : not supposed to be fired");
    };

    return Expression;

  })();

}).call(this);
