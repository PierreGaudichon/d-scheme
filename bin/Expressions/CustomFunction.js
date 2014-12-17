// Generated by CoffeeScript 1.8.0
(function() {
  var CustomFunction, Function, Type,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Function = require("./Function").Function;

  Type = require("./../Type").Type;

  module.exports.CustomFunction = CustomFunction = (function(_super) {
    __extends(CustomFunction, _super);

    CustomFunction.prototype.parameters = [];

    CustomFunction.prototype.body = "Expression";

    function CustomFunction(params, body) {
      this.parameters = params;
      this.body = body;
    }

    CustomFunction.prototype.evaluate = function(args, P) {
      var a, i, param, ret, _i, _len, _ref;
      a = {};
      _ref = this.parameters;
      for (i = _i = 0, _len = _ref.length; _i < _len; i = ++_i) {
        param = _ref[i];
        a[param] = args[i];
      }
      p.context.push(a);
      ret = this.body.resolve(P);
      P.context.pop();
      return ret;
    };

    return CustomFunction;

  })(Function);

}).call(this);
