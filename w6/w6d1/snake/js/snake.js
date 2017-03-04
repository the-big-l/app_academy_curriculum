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
