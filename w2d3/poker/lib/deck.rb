require_relative 'card'

class Deck
  SUITS = [:spade, :diamond, :club, :heart]

  def initialize(deck = create_cards)
    @stack = deck
  end

  def shuffle!
    @stack.shuffle!
  end

  def take
    @stack.pop
  end

  def empty?
    @stack.empty?
  end

  private

  def create_cards
    result = []

    SUITS.each do |suit|
      (1..13).to_a.reverse.each do |value|
        result << Card.new(suit, value)
      end
    end

    result
  end
end
