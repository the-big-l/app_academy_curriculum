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

	const HanoiGame = __webpack_require__ (1);
	const HanoiView = __webpack_require__ (2);

	$( () => {
	  const $rootEl = $('.hanoi');
	  const game = new HanoiGame();
	  new HanoiView(game, $rootEl);
	});


/***/ },
/* 1 */
/***/ function(module, exports) {

	class Game {
	  constructor() {
	    this.towers = [[3, 2, 1], [], []];
	  }

	  isValidMove(startTowerIdx, endTowerIdx) {
	      const startTower = this.towers[startTowerIdx];
	      const endTower = this.towers[endTowerIdx];

	      if (startTower.length === 0) {
	        return false;
	      } else if (endTower.length == 0) {
	        return true;
	      } else {
	        const topStartDisc = startTower[startTower.length - 1];
	        const topEndDisc = endTower[endTower.length - 1];
	        return topStartDisc < topEndDisc;
	      }
	  }

	  isWon() {
	      // move all the discs to the last or second tower
	      return (this.towers[2].length == 3) || (this.towers[1].length == 3);
	  }

	  move(startTowerIdx, endTowerIdx) {
	      if (this.isValidMove(startTowerIdx, endTowerIdx)) {
	        this.towers[endTowerIdx].push(this.towers[startTowerIdx].pop());
	        return true;
	      } else {
	        return false;
	      }
	  }

	  print() {
	      console.log(JSON.stringify(this.towers));
	  }

	  promptMove(reader, callback) {
	      this.print();
	      reader.question("Enter a starting tower: ", start => {
	        const startTowerIdx = parseInt(start);
	        reader.question("Enter an ending tower: ", end => {
	          const endTowerIdx = parseInt(end);
	          callback(startTowerIdx, endTowerIdx)
	        });
	      });
	  }

	  run(reader, gameCompletionCallback) {
	      this.promptMove(reader, (startTowerIdx, endTowerIdx) => {
	        if (!this.move(startTowerIdx, endTowerIdx)) {
	          console.log("Invalid move!");
	        }

	        if (!this.isWon()) {
	          // Continue to play!
	          this.run(reader, gameCompletionCallback);
	        } else {
	          this.print();
	          console.log("You win!");
	          gameCompletionCallback();
	        }
	      });
	  }
	}

	module.exports = Game;


/***/ },
/* 2 */
/***/ function(module, exports) {

	class HanoiView {
	  constructor(game, $figure) {
	    this.game = game;
	    this.$figure = $figure;
	    this.setupTowers();
	    this.render();
	    this.clickTower();
	    this.counter = 0;
	    this.firstTower = null;
	  }

	  setupTowers() {

	    for(let i = 0; i < 3; i++) {
	      const $stack = $(`<ul class=stack${i}></ul>`);

	      for (let j = 0; j < 3; j++) {
	        const $disc = $('<li></li>');
	        // $disk.data('pos', `${i},${j}`);
	        $stack.append($disc);
	      }

	      this.$figure.append($stack);
	    }

	  }

	  render() {
	    $('li').removeClass();
	    this.game.towers.forEach((gameStack, idx1) => {


	      gameStack.forEach((stone, idx2) => {
	        const $viewLi = $(`.stack${idx1} :nth-last-child(${idx2 + 1})`);
	        $viewLi.addClass(`disc${stone}`);
	      });

	    });

	  }

	  clickTower() {
	    $('ul').click((e) => {
	      const $stack = $(e.currentTarget);
	      const move = $stack.attr('class').slice(-1);

	      if (this.counter === 0) { // no clicks
	        this.firstTower = move;
	        $stack.toggleClass('selected');
	      } else {
	        $('.selected').toggleClass('selected');
	        this.isValidMove(this.firstTower, move);
	        this.game.move(this.firstTower, move);
	      }

	      this.counter = (this.counter + 1) % 2;
	      this.render();
	      this.isWon();
	    });
	  }

	  isValidMove(first, move) {
	    if (!this.game.isValidMove(first, move)) {
	      alert('invalid move');
	    }
	  }

	  isWon() {
	    if (this.game.isWon()) {
	      $('ul').off('click');
	      this.$figure.prepend($("<h1>you've won!</h1>"));
	      $('.disc1').css('background-color', 'green');
	      $('.disc2').css('background-color', 'green');
	      $('.disc3').css('background-color', 'green');
	    }
	  }
	}

	module.exports = HanoiView;


/***/ }
/******/ ]);