/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	
	var GameView = __webpack_require__(1);
	var canvasEl = document.getElementsByTagName("canvas")[0];
	canvasEl.height = window.innerHeight;
	canvasEl.width = window.innerWidth;
	new GameView(canvasEl).start();


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	
	var Game = __webpack_require__(2);

	function GameView(canvasEl) {
	    this.ctx = canvasEl.getContext("2d");
	    this.game = new Game(canvasEl.height, canvasEl.width);
	}

	GameView.prototype.start = function () {
	  setInterval(this.game.moveObjects.bind(this.game), 20);
	  setInterval(this.game.draw.bind(this.game, this.ctx), 20);

	};


	module.exports = GameView;


/***/ },
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	var Asteroid = __webpack_require__(3);
	var Ship = __webpack_require__(6);

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


/***/ },
/* 3 */
/***/ function(module, exports, __webpack_require__) {

	var MovingObject = __webpack_require__(4);
	var Util = __webpack_require__(5);

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


/***/ },
/* 4 */
/***/ function(module, exports) {

	
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


/***/ },
/* 5 */
/***/ function(module, exports) {

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


/***/ },
/* 6 */
/***/ function(module, exports, __webpack_require__) {

	
	var MovingObject = __webpack_require__(4);
	var Util = __webpack_require__(5);

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


/***/ }
/******/ ]);