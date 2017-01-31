require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([4,4], board)
  end

  def render
    puts '   ' + (0..7).to_a.join('  ') + ' '
    @board.grid.each_with_index do |row, i|
      print i.to_s + ' '
      row.each_with_index do |piece, j|
        if [i,j] == @cursor.cursor_pos
          print piece.name.colorize( :background => :red)
        else
          sq_co = (i + j).even? ? :white : :black
          print piece.name.colorize( :background => sq_co)
        end
      end
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
