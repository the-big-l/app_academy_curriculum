class Card
  WORDS = {
    1 => 'A',
    2 => '2',
    3 => '3',
    4 => '4',
    5 => '5',
    6 => '6',
    7 => '7',
    8 => '8',
    9 => '9',
    10 => '10',
    11 => 'J',
    12 => 'Q',
    13 => 'K'
  }
  attr_reader :suit, :value
  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def to_s
    suit.to_s[0].upcase + WORDS[value]
  end
end
