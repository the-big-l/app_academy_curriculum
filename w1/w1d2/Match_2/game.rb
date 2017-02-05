require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'computer_player.rb'

class Game
  def initialize(player)
    @board = Board.new
    @player = player
  end

  def run
    system("clear")
    @board.render
    until game_over?
      play_round
    end

    puts 'you win!'
  end

  def play_round
    first_guess = get_guess
    handle_guess_input(first_guess)

    second_guess = get_guess
    handle_guess_input(second_guess)

    handle_card_matching(first_guess, second_guess)
    @board.render
  end

  def handle_guess_input(pos)
    @board.reveal(pos)
    @player.receive_revealed_card(@board[pos].face_value, pos)
    @board.render
  end

  def handle_card_matching(first_guess, second_guess)
    if cards_matching?(first_guess, second_guess)
      @player.receive_match(@board[first_guess].face_value)
    else
      hide_unmatched_cards(first_guess, second_guess)
    end
  end

  def hide_unmatched_cards(first_guess, second_guess)
    puts "Not matching"
    @board[first_guess].hide
    @board[second_guess].hide
  end

  def get_guess
    guess = @player.get_input
    case check_guess(guess)
    when :good
      return guess
    when :out_of_range
      puts "Position out of range"
      return get_guess
    when :face_up
      puts "Card already facing up"
      return get_guess
    end
  end

  def check_guess(pos)
    return :out_of_range unless @board.valid_range?(pos)
    return :face_up unless @board.face_down?(pos)
    :good
  end

  def game_over?
    @board.won?
  end

  def cards_matching?(guess1, guess2)
    @board.matching?(guess1, guess2)
  end
end

if __FILE__ == $PROGRAM_NAME
  player = ComputerPlayer.new
  game = Game.new(player)
  game.run
end
