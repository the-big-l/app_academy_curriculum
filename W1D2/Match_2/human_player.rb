class HumanPlayer
  def initialize(name)
    @name = name
  end

  def get_input
    print "guess a card ('row, col') > "
    gets.chomp.split(',').map(&:to_i)
  end

end
