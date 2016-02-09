var MovingObject = require('./movingObject.js');
var Util = require('./util.js');

function Asteroid(pos, game) {
  this.game = game;
  this.pos = pos;
  this.radius = 10;
  var HEX_DIGITS = "0123456789ABCDEF";
  this.color = HEX_DIGITS[Math.floor((Math.random() * 16))];
  this.vel = Util.randomVec(6);
}


Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;
