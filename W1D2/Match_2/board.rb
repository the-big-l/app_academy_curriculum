require_relative 'card.rb'

class Board
  def initialize
    populate
  end

  def populate
    @board = []

    (1..5).each do |i|
      2.times { @board << Card.new(i) }
    end

    @board = @board.shuffle.each_slice(5).to_a
  end

  def render
    # system('clear')
    puts "Current:"
    @board.each do |row|
      puts row.map { |card| card.display }.join(' ')
    end
  end

  def won?
    @board.flatten.none? { |card| card.face_down }
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def face_down?(pos)
    self[pos].face_down
  end

  def reveal(pos)
    card = self[pos]
    card.reveal
    card.display
  end

  def valid_range?(pos)
    pos[0] < @board.size && pos[1] < @board.first.size && pos.min > -1
  end

  def matching?(pos1, pos2)
    self[pos1] == self[pos2]
  end
end
