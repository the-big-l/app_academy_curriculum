require 'byebug'
class StaticArray
  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    @store[i]
  end

  def []=(i, val)
    validate!(i)
    @store[i] = val
  end

  def length
    @store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, @store.length - 1)
  end
end

class DynamicArray
  attr_reader :count

  include Enumerable

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
    @store[i]
  rescue
    nil
  end

  def []=(i, val)
    @store[i] = val
  end

  def capacity
    @store.length
  end

  def include?(val)
  end

  def push(val)
    @count += 1
    resize! if @count >= capacity
    @store[count - 1] = val
  end

  def unshift(val)
    @count += 1
    resize! if @count >= capacity
    unshifted_arr = StaticArray.new(capacity)
    unshifted_arr[0] = val

    self.each_with_index do |el, i|
      break if (i + 1) > (capacity - 1)
      unshifted_arr[i + 1] = el
    end

    @store = unshifted_arr
  end

  def pop
    output = @store[count]
    @store[count] = nil
    @count -= 1
    return output
  end

  def shift
    @count -= 1
    shifted_arr = StaticArray.new(capacity)
    self.each_with_index do |el, i|
      next if i == 0
      shifted_arr[i] = el
    end
    @store = shifted_arr
  end

  def first
    @store[0]
  end

  def last
    @store[@count - 1]
  end

  def each(&prc)
    idx = 0
    while idx < count
      prc.call(@store[idx])
      idx += 1
    end

    nil
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    # ...
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
  #   new_array = StaticArray.new(capacity * 2)
  #   self.each do |el|
  #     new_array[i] = el
  #   end
  #   @store = new_array
  end
end
