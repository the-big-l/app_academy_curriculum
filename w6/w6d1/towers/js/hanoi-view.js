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
