require 'colorize'

class Tile
  attr_reader :value, :given
  def initialize(value)
    @value = value
    @given = !value.zero?
  end

  def to_s
    return ' ' if @value.zero?
    @value.to_s.colorize(@given ? :red : :blue)
  end

  def value=(new_value)
    @value = new_value unless @given
  end
end
