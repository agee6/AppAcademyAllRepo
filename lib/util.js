var Util = {};

 Util.inherits = function (ChildClass, ParentClass){

  function Surrogate() {}

  Surrogate.prototype = ParentClass.prototype;
  ChildClass.prototype = new Surrogate();
  ChildClass.prototype.constructor = ChildClass;

};

Util.randomVec = function(length) {
  var dx = Math.random()* 2 - 1;
  var dy = Math.random()* 2 - 1;
  var vx = dx * length;
  var vy = dy * length;
  return [vx, vy];
};

module.exports = Util;
