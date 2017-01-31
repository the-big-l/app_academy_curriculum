require 'byebug'
module SteppingPiece
  KING_MOVES = [[0,1], [0, -1], [1, 0], [-1, 0], [1,1], [-1, -1], [-1, 1], [1, -1]]
  KNIGHT_MOVES = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]

  def move
    directions = self.move_dirs

    possible_moves = []

    directions.each do |dir|
      new_move = add_pos(@pos, dir)
      if @board.in_bounds?(new_move) && @board[new_move].color != @color
        possible_moves << new_move
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

module SlidingPiece

  HORIZONTAL = [[0,1], [0, -1], [1, 0], [-1, 0]]
  DIAGONAL = [[1,1], [-1, -1], [-1, 1], [1, -1]]

  def move
    directions = self.move_dirs
    possible_moves = []

    directions.each do |dir|
      new_move = add_pos(@pos, dir)

      while @board.in_bounds?(new_move) && @board[new_move].color != @color
        possible_moves << new_move
        break if @board[new_move].color != 'blank'
        new_move = add_pos(new_move, dir)
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
