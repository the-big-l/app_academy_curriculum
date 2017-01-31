require_relative 'piece'

class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.instance }}
    initial_setup
  end

  def [](pos)
    x,y = pos
    @grid[x][y]
  end

  def []=(pos,val)
    x,y = pos
    @grid[x][y] = val
  end

  def move_piece(start_pos, end_pos)
    raise "There is no piece at this position" if self[start_pos].nil?
    raise "Invalid move!" unless self[end_pos].nil?
    self[start_pos] , self[end_pos] = self[end_pos] , self[start_pos]
  end

  def in_bounds?(pos)
    x, y = pos
    return (x >= 0) && (x <= 7) && (y >= 0) && (y <= 7)
  end

  def initial_setup
    place_pawns(:white, 1)
    place_pawns(:black, 6)

    place_other_pieces(:white, 0)
    place_other_pieces(:black, 7)
  end

  def place_pawns(color, row)
    (0..7).each do |col|
      self[[row, col]] = Pawn.new(self, [row, col], color)
    end
  end

  def place_other_pieces(color, row)
    self[[row, 0]] = Rook.new(self, [row, 0], color)
    self[[row, 1]] = Knight.new(self, [row, 1], color)
    self[[row, 2]] = Bishop.new(self, [row, 2], color)
    self[[row, 3]] = King.new(self, [row, 3], color)
    self[[row, 4]] = Queen.new(self, [row, 4], color)
    self[[row, 5]] = Bishop.new(self, [row, 5], color)
    self[[row, 6]] = Knight.new(self, [row, 6], color)
    self[[row, 7]] = Rook.new(self, [row, 7], color)
  end

  def place_piece(piece, pos)
    self[pos] = piece
  end

end
