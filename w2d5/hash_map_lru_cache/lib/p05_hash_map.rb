require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable

  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    @count += 1 unless bucket(key).include?(key)
    resize! if @count > num_buckets
    bucket(key).include?(key) ? bucket(key).update(key, val) : bucket(key).append(key, val)
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    bucket(key).remove(key)
    @count -= 1
  end

  def each(&prc)
    @store.each do |linked_list|
      linked_list.each do |link|
        prc.call(link.key, link.val)
      end
    end

    nil
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_array = Array.new(num_buckets * 2) { LinkedList.new }
    @store.each do |linked|
      linked.each do |link|
        idx = (link.key.hash % (num_buckets * 2))
        new_array[idx].append(link.key, link.val)
      end
    end
    @store = new_array
  end

  def bucket(key)
    @store[key.hash % num_buckets]
  end
end
