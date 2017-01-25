class ComputerPlayer
  attr_reader :card_positions, :match
  def initialize
    @name = 'Gizmo'
    @card_positions = Hash.new { |h, k| h[k] = [] }
    populate_guesses
    @first_guess = false
    @first_guess_value = nil
    @first_guess_pos = []
    @match = []
    @found_matches = []
  end

  def get_input
    @first_guess = !@first_guess
    if @first_guess
      return first_input
    else
      return second_input
    end
  end


  def first_input
    if have_match?
      key, @match = get_matched_pair
      @card_positions.delete(key)
      @first_guess_pos = @match.pop
      return @first_guess_pos
    else
      guess = get_unknown
      @first_guess_pos = guess
      return guess
    end
  end

  def second_input
    if !@match.empty?
      return @match.pop
    elsif have_match?
      current_matches = @card_positions[@first_guess_value]
      if current_matches.first == @first_guess_pos
        return current_matches.first
      else
        return current_matches.last
      end
    else
      return get_unknown
    end
  end

  def get_matched_pair
    @card_positions.each.select do |key, vals|
      vals.size == 2 && !@found_matches.include?(key)
    end.first
  end

  def receive_match(face_value)
    @found_matches << face_value
  end

  def receive_revealed_card(value, pos)
    @card_positions[value] << pos
    @first_guess_value = value
  end

  def have_match?
    @card_positions.each.any? { |key, vals| vals.size == 2 && !@found_matches.include?(key)}
  end

  def get_unknown
    @possible_positions.pop
  end

  def populate_guesses
    @possible_positions = []

    2.times do |row|
      5.times do |col|
        @possible_positions << [row, col]
      end
    end
  end

end
