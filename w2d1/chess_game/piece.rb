require 'singleton'
require_relative 'modules'

class Piece
  attr_reader :color, :name
  attr_accessor :pos

  def initialize(board, pos, color)
    @pos = pos
    @board = board
    @color = color
  end

  def valid_moves
    valid_moves = []

    self.move.each do |pos_move|
      new_board = @board.dup
      new_board.move_piece!(@pos, pos_move)
      valid_moves << pos_move unless new_board.in_check?(@color)
    end

    valid_moves
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
  UP_MOVES = [[-1, -1], [-1, 1]]
  DOWN_MOVES = [[1, 1], [1, -1]]
  def initialize(board, pos, color)
    super(board, pos, color)
    @start_row = pos[0]
    @name = ' P '.colorize(color)
  end


  def move
    possible_moves = []

    if @start_row == 1
      possible_moves += diagonal_move(DOWN_MOVES)

      possible_moves << straight_move(@pos, [1, 0])
      possible_moves << straight_move(@pos, [2, 0]) if at_start_row?
    else
      possible_moves += diagonal_move(UP_MOVES)

      possible_moves << straight_move(@pos, [-1, 0])
      possible_moves << straight_move(@pos, [-2, 0]) if at_start_row?
    end

    possible_moves
  end


  def straight_move(pos, dir)
    new_move = add_pos(pos, dir)
    return new_move if @board[new_move].class == NullPiece && @board.in_bounds?(new_move)
  end

  def diagonal_move(moves)
    possible_moves = []
    moves.each do |dir|
      new_move = add_pos(@pos, dir)
      next unless @board.in_bounds?(new_move)
      possible_moves << new_move if @board[new_move].color == @board.opposite_color(@color)
    end

    possible_moves
  end

  def at_start_row?
    pos[0] == @start_row
  end

  def add_pos(pos1, pos2)
    x1, y1 = pos1
    x2, y2 = pos2
    [x1+x2, y1+y2]
  end
end

class NullPiece < Piece
  include Singleton

  def initialize
    @name = '   '
    @color = :null
  end

  def move
    []
  end


end
