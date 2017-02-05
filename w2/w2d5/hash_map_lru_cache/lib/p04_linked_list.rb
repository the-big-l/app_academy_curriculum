require 'byebug'
class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.

    @next.prev = @prev
    @prev.next = @next
  end
end

class LinkedList
  include Enumerable


  def initialize
    @head = Link.new(:head)
    @tail = Link.new(:tail)
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each do |link|
      return link.val if link.key == key
    end

    nil
  end

  def include?(key)
    self.each do |link|
      return true if key == link.key
    end
    false
  end

  def append(key, val)
    new_link = Link.new(key, val)
    new_link.prev = @tail.prev
    @tail.prev.next = new_link
    @tail.prev = new_link
    new_link.next = @tail
  end

  def update(key, val)
    self.each do |link|
      link.val = val if link.key == key
    end
  end

  def remove(key)
    self.each do |link|
      link.remove if link.key == key
    end
  end

  def each(&prc)
    current_link = @head.next
    until current_link == @tail
      prc.call(current_link)
      current_link = current_link.next
    end

    nil
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
