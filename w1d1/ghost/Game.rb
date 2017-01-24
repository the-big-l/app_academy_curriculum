require_relative 'player.rb'

class Game

  def initialize(player_1, player_2, dictionary)
    @player_1, @player_2 = player_1, player_2
    @current_player = player_1
    @fragment = ''
    @dictionary_name = dictionary
  end

  def play_round

  end

  private

  attr_accessor :current_player

  def next_player!
    current_player == @player_1 ? @player_2 : @player_1
  end

  def take_turn(player)
    player.guess
  end

  def valid_play?

  end

end
