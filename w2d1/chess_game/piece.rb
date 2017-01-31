class Piece
  attr_reader :pos, :color, :name

  def initialize(board, pos, color)
    @pos = pos
    @board = board
    @color = color
  end
end


module SlidingPiece

  HORIZONTAL = [[0,1], [0, -1], [1, 0], [-1, 0]]
  DIAGONAL = [[1,1], [-1, -1], [-1, 1], [1, -1]]

  def move
    directions = self.move_dirs
    possible_moves = []

    directions.each do |dir|
      move = @pos

      while @board[move].color == @color || !@board.in_bound?(move)
        move = add_pos(@pos, dir)
        possible_moves << move
        break unless @board[move].color == @color
      end
    end

    possible_moves
  end

  private
  def add_pos(pos1, pos2)
    x1, y1 = pos1
    x2, y2 = pos2
    [x1+x2, y1+y2]
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

class NullPiece < Piece
  include Singleton

  def initialize
    @color = 'blank'
    @name = '   '.colorize(color)
  end
end
