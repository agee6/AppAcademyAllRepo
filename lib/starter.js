
var GameView = require('./gameView.js');
var canvasEl = document.getElementsByTagName("canvas")[0];
canvasEl.height = window.innerHeight;
canvasEl.width = window.innerWidth;
new GameView(canvasEl).start();
