const Snake = require("./snake.js");

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
