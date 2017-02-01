class TowersOfHanoi
  attr_accessor :stack
  def initialize(size)
    @size = size
    @stack = Array.new(3) {[]}
    @stack[0] = (1..size).to_a.reverse
  end

  # def play
  #   until won?
  #     print "enter a from tower and to tower > "
  #     input = gets.chomp
  #     move(input)
  #   end
  # end

  def move(input)
    from, to = input
    raise "Empty 'from' stack" if @stack[from].empty?
    unless @stack[to].empty?
      raise "Invalid move" if @stack[from].last > @stack[to].last
    end
    @stack[to] << @stack[from].pop
  end

  def won?
    @stack[0].empty? &&
      @stack[1] == (1..@size).to_a.reverse ||
      @stack[2] == (1..@size).to_a.reverse
  end
end
