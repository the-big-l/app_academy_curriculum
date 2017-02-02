class Hand
  attr_reader :stack
  
  def initialize(stack = [])
    @stack = stack
  end

  def take(suit, value)
    result = @stack.select do |card|
      card.suit == suit && card.value == value
    end

    raise 'Not Available' if result.empty?
    @stack.delete(result.first)
  end
end
