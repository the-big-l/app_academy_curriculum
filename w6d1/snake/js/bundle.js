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

	const SnakeView = __webpack_require__(1);
	const Board = __webpack_require__(2);

	$(() => {
	  const $figure = $('figure.board');
	  const board = new Board(40);
	  const view = new SnakeView(board, $figure);

	});


/***/ },
/* 1 */
/***/ function(module, exports) {

	class SnakeView {
	  constructor(board, $figure) {
	    this.board = board;
	    this.$figure = $figure;
	    this.setupBoard();
	    this.startListener();
	    window.setInterval(this.step.bind(this), 500);
	  }

	  setupBoard() {
	    for(let i = 0; i < this.board.size; i++) {
	      const $row = $(`<ul></ul>`);

	      for (let j = 0; j < this.board.size; j++) {
	        const $square = $('<li></li>');
	        $square.attr('data-pos', `${i},${j}`);
	        $row.append($square);
	      }

	      this.$figure.append($row);
	    }
	  }

	  startListener() {
	    $('body').keydown(e => {
	      this.handleKeyEvent(e.which);
	    });
	  }

	  handleKeyEvent(key) {
	    switch (key)
	    {
	      case 87:
	      case 38:
	        this.board.snake.turn("N");
	        break;

	      case 65:
	      case 37:
	        this.board.snake.turn("W");
	        break;

	      case 83:
	      case 40:
	        this.board.snake.turn("S");
	        break;

	      case 68:
	      case 39:
	        this.board.snake.turn("E");
	        break;
	    }
	  }

	  render() {
	    $('.snake').removeClass('snake');

	    this.board.snake.segments.forEach(pos => {
	      const stringPos = pos.join(',');
	      $(`li[data-pos="${stringPos}"]`).addClass('snake');
	    });
	  }

	  step() {

	    this.board.snake.move();
	    this.render();
	  }

	}

	module.exports = SnakeView;


/***/ },
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	const Snake = __webpack_require__(3);

	class Board {
	  constructor(size = 20) {
	    this.board = this.setupBoard();
	    this.snake = new Snake();
	    this.size = size;
	  }

	  setupBoard() {
	    let matrix = [];

	    for(var i=0; i<this.size; i++) {
	      matrix[i] = new Array(this.size);
	    }

	    return matrix;
	  }
	}
	module.exports = Board;


/***/ },
/* 3 */
/***/ function(module, exports) {

	class Snake {
	  constructor(){
	    this.direction = "N";
	    this.segments = [[19, 10]];
	    this.dir = {
	      N: [-1, 0],
	      S: [1, 0],
	      E: [0, 1],
	      W: [0, -1]
	    };
	  }

	  move() {
	    const head = this._plus(this.segments[0] + this.dir[this.direction]);
	    this.segments.unshift(head);
	    this.segments.pop();
	  }

	  turn(dir) {
	    this.direction = dir;
	  }

	  _plus(pos, dir) {
	    const x = pos[0] + dir[0];
	    const y = pos[1] + dir[1];
	    return [x, y];
	  }
	}

	module.exports = Snake;


/***/ }
/******/ ]);