require_relative 'player'
require_relative 'board'
require_relative 'display'


class Game
  attr_accessor :board, :display
  def initialize
    @board = Board.new
    @board.initial_setup
    @display = Display.new(@board)
    @player1 = HumanPlayer.new('leo', :yellow, @display)
    @player2 = HumanPlayer.new('aivy', :cyan, @display)
    @curr_player = @player1
  end

  def play
    until @board.checkmate?(@curr_player.color)
      begin
        @curr_player.play_turn
      rescue InvalidMove => e
        puts e.message
      retry
      end

      @curr_player = (@curr_player == @player1 ? @player2 : @player1)
    end

    puts "Game over!"
  end

end

if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
