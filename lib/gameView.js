
var Game = require('./game.js');

function GameView(canvasEl) {
    this.ctx = canvasEl.getContext("2d");
    this.game = new Game(canvasEl.height, canvasEl.width);
}

GameView.prototype.start = function () {
  setInterval(this.game.moveObjects.bind(this.game), 20);
  setInterval(this.game.draw.bind(this.game, this.ctx), 20);

};


module.exports = GameView;
