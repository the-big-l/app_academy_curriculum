require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([4,4], board)
  end

  def render
    @board.grid.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        if [i,j] == @cursor.cursor_pos
          print piece.name.colorize( :background => :red)
        else
          print piece.name
        end
      end
      print "\n"
      print "\n"
    end
  end

  def move
    while true
      system("clear")
      render
      @cursor.get_input
    end
  end


end

if __FILE__ == $PROGRAM_NAME
  Display.new(Board.new).move
end
