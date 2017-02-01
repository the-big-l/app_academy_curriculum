require_relative 'cursor'

class HumanPlayer
  attr_reader :color

  def initialize(name, color, display)
    @name = name
    @color = color
    @display = display
  end

  def play_turn
    start_pos = nil
    end_pos = nil
    while start_pos.nil?
      system("clear")
      @display.render
      input = @display.cursor.get_input
      start_pos = input unless input.nil?
    end

    while end_pos.nil?
      system("clear")
      @display.render
      input = @display.cursor.get_input
      end_pos = input unless input.nil?
    end
    @display.board.move_piece(start_pos, end_pos)
  end


end
