const SnakeView = require("./snakeView.js");
const Board = require("./board.js");

$(() => {
  const $figure = $('figure.board');
  const board = new Board(40);
  const view = new SnakeView(board, $figure);

});
