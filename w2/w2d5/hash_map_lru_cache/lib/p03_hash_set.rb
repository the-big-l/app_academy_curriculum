require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    @count += 1
    resize! if @count > num_buckets
    self[num] << num
  end

  def include?(num)
    self[num].include?(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_array = Array.new(num_buckets * 2) { [] }
    @store.each do |bucket|
      bucket.each do |el|
        new_array[el.hash % (num_buckets * 2)] << el
      end
    end
    @store = new_array
  end
end
