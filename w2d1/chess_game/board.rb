require_relative 'piece'

class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.instance }}
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



end
