class View {
  constructor(game, $el) {
    this.$el = $el;
    this.game = game;
    this.setupBoard();
    this.bindEvents();

  }

  bindEvents() {
    $('li').click(e => {


      // set clicked class

      // unset unclicked class
      this.makeMove($(e.currentTarget));
    });
  }

  makeMove($li) {
    const mark = this.game.currentPlayer;
    $li.text(mark);
    $li.addClass(mark);
    $li.addClass('clicked');
    $li.removeClass('unclicked');
    const pos = $li.data('pos').split(',').map(el => parseInt(el));

    this.game.playMove(pos);
    if (this.game.isOver()) {
      this.$el.append($(`<h1>${this.game.winner()} wins!</h1>`));
      $('li').off('click');
    }
  }

  setupBoard() {

      const $row = $('<ul></ul>');

    for(let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        const $square = $('<li class="unclicked"></li>');
        $square.data('pos', `${i},${j}`);
        $row.append($square);
      }
    }
      this.$el.append($row);
  }
}

module.exports = View;
