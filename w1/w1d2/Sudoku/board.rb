require_relative 'tile.rb'

class Board
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def self.from_file(file_name)
    grid = File.readlines(file_name).map do |line|
      line.split(//).map { |el| Tile.new(el.to_i) }
    end

    Board.new(grid)
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  alias update_tile []=


end
