require 'colorize'
require_relative 'cursor'

class Display
  COORD = {
    0 => '8',
    1 => '7',
    2 => '6',
    3 => '5',
    4 => '4',
    5 => '3',
    6 => '2',
    7 => '1',
  }

  attr_reader :cursor, :board
  def initialize(board)
    @board = board
    @cursor = Cursor.new([4,4], board)
  end

  def render
    # puts '   ' + (0..7).to_a.join('  ') + ' '
    puts '   ' + ('a'..'h').to_a.join('  ') + ' '
    @board.grid.each_with_index do |row, i|
      print COORD[i] + ' ' #i.to_s
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
end
