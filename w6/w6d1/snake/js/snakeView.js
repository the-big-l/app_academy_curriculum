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
