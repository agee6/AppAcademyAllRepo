
 var MovingObject = function(pos, vel, radius, color) {
  this.pos = pos;
  //this.vel = vel;
  this.radius = radius;
  this.color = color;
};

MovingObject.prototype.draw = function(ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();

  ctx.arc(
      this.pos[0],
      this.pos[1],
      this.radius,
      0,
      2 * Math.PI,
      false
    );
    ctx.fill();

};

MovingObject.prototype.move = function() {
  this.pos = this.game.wrap(this.pos);
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
};

MovingObject.prototype.isCollidedWith = function(otherObject) {
  var distance = Math.sqrt(Math.pow((this.pos[0] - otherObject.pos[0]),2) + Math.pow((this.pos[1] - otherObject.pos[1]),2));
  if (distance < (this.radius + otherObject.radius - 2)){
    return 1;

  }
  return 0;
};

module.exports = MovingObject;
