
var MovingObject = require('./movingObject.js');
var Util = require('./util.js');

function Ship(game) {
  this.game = game;
  this.pos = game.randomPosition();
  this.radius = 5;
  var HEX_DIGITS = "0123456789ABCDEF";
  this.color = "ff0000";
  this.vel = [0,0];
}
Ship.prototype.relocate = function() {
  this.pos = this.game.randomPosition();
};


Util.inherits(Ship, MovingObject);
module.exports = Ship;
