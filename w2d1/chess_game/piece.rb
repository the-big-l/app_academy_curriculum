require 'singleton'
require_relative 'modules'

class Piece
  attr_reader :pos, :color, :name

  def initialize(board, pos, color)
    @pos = pos
    @board = board
    @color = color
  end
end

class Queen < Piece
  include SlidingPiece

  def initialize(board, pos, color)
    super(board, pos, color)
    @name = ' Q '.colorize(color)
  end

  def move_dirs
    SlidingPiece::HORIZONTAL + SlidingPiece::DIAGONAL
  end
end

class Rook < Piece
  include SlidingPiece

  def initialize(board, pos, color)
    super(board, pos, color)
    @name = ' R '.colorize(color)
  end

  def move_dirs
    SlidingPiece::HORIZONTAL
  end
end

class Bishop < Piece
  include SlidingPiece

  def initialize(board, pos, color)
    super(board, pos, color)
    @name = ' B '.colorize(color)
  end

  def move_dirs
    SlidingPiece::DIAGONAL
  end
end

class King < Piece
  include SlidingPiece

  def initialize(board, pos, color)
    super(board, pos, color)
    @name = ' K '.colorize(color)
  end

  def move_dirs
    SteppingPiece::KING_MOVES
  end
end

class Knight < Piece
  include SteppingPiece

  def initialize(board, pos, color)
    super(board, pos, color)
    @name = ' H '.colorize(color)
  end

  def move_dirs
    SteppingPiece::KNIGHT_MOVES
  end
end

class Pawn < Piece
  def initialize(board, pos, color)
    super(board, pos, color)
    @name = ' P '.colorize(color)
  end
end

class NullPiece < Piece
  include Singleton

  def initialize
    @name = '   '
  end
end
