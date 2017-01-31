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
    raise "Invalid move!" unless self[start_pos].valid_moves.include?(end_pos)

    move_piece!(start_pos, end_pos)
  end

  def move_piece!(start_pos, end_pos)
    raise "There is no piece at this position" if self[start_pos].class == NullPiece

    if self[end_pos].class == NullPiece
      self[start_pos] , self[end_pos] = self[end_pos] , self[start_pos]
    else
      self[end_pos] = self[start_pos]
      self[start_pos] = NullPiece.instance
    end

    self[end_pos].pos = end_pos
  end

  def in_bounds?(pos)
    x, y = pos
    return (x >= 0) && (x <= 7) && (y >= 0) && (y <= 7)
  end

  def initial_setup
    @col = [:yellow, :cyan]
    place_pawns(@col[0], 1)
    place_pawns(@col[1], 6)

    place_other_pieces(@col[0], 0)
    place_other_pieces(@col[1], 7)
  end

  def opposite_color(color)
    color == @col[0] ? @col[1] : @col[0]
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

  def in_check?(color)
    all_possible_moves = []
    king_pos = []
    enemy_color = opposite_color(color)

    (0..7).each do |row|
      (0..7).each do |col|
        curr_piece = self[[row, col]]

        if curr_piece.color == color && curr_piece.class == King
          king_pos = [row, col]
        elsif curr_piece.color == enemy_color
          all_possible_moves += curr_piece.move
        end

      end
    end
    all_possible_moves.include?(king_pos)
  end

  def dup
    new_board = Board.new

    (0..7).each do |row|
      (0..7).each do |col|
        curr_piece = self[[row, col]]
        if curr_piece.class == NullPiece
          new_board[[row, col]] = NullPiece.instance
        else
          curr_class = curr_piece.class
          curr_pos = curr_piece.pos
          curr_color = curr_piece.color
          new_board[[row, col]] = curr_class.new(new_board, curr_pos, curr_color)
        end
      end
    end

    new_board
  end



end
