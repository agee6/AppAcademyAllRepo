var Asteroid = require('./asteroid.js');
var Ship = require('./ship.js');

function Game(height, width) {
  this.dimX = 900;
  this.dimY = 900;
  this.numAsteroids = 20;
  this.asteroids = [];
  this.addAsteroids();

}

Game.prototype.addAsteroids= function() {

  for (var i = 0; i < this.numAsteroids; i++) {
    var aster = new Asteroid(this.randomPosition(), this);
    this.asteroids.push(aster);
  }
  var ship = new Ship(this);
  this.asteroids.push(ship);


};

Game.prototype.draw = function(ctx) {
    ctx.clearRect(0,0,this.dimY + 10 ,this.dimX + 10);
  for (var i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].draw(ctx);
  }

};

Game.prototype.moveObjects = function() {
  for (var i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].move();
  }
  this.checkCollisions();
};
Game.prototype.checkCollisions = function() {
  var collided = [];
  for (var i = 0; i < this.asteroids.length - 1; i++) {
    for (var j = i + 1; j < this.asteroids.length; j++) {
     if (this.asteroids[i].isCollidedWith(this.asteroids[j])) {
       collided.push(this.asteroids[i]);
       collided.push(this.asteroids[j]);
     }
    }
  }
  for (var i = 0; i < collided.length; i++) {

    this.remove(collided[i]);
  }

};
Game.prototype.remove = function(asteroid) {
  var index;
  for (var i = 0; i < this.asteroids.length; i++) {
    if (this.asteroids[i] === asteroid){
      index = i;
    }
  }
  this.asteroids.splice(index,1);

};

Game.prototype.wrap = function(pos){
  if (pos[0] < 0) {
    pos[0] = this.dimX;

  }
  if (pos[0] > this.dimX) {
    pos[0] = 0;
  }
  if (pos[1] < 0) {
    pos[1] = this.dimY;
  }
  if (pos[1] > this.dimY){
    pos[1] = 0;
  }
  return pos;
};

Game.prototype.randomPosition = function() {

  var xpos = Math.random() * this.dimX;
  var ypos = Math.random() * this.dimY;
  return [xpos, ypos];
};

module.exports = Game;
