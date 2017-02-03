class MyQueue
  def initialize
    @store = []
  end

  def enqueue(element)
    store.unshift(element)
    element
  end

  def dequeue
    store.pop
  end

  def peek
    store.last
  end

  def size
    store.size
  end

  def empty?
    store.empty?
  end

  private
  attr_reader :store
end

class MyStack
  def initialize
    @store = []
    @max_store = []
    @min_store = []
  end

  def pop
    max_store.pop if store.last == max_store.last
    min_store.pop if store.last == min_store.last

    store.pop
  end

  def push(element)
    max_store << element if max_store.empty? || max_store.last <= element
    min_store << element if min_store.empty? || min_store.last >= element

    store << element
  end

  def size
    store.size
  end

  def empty?
    store.empty?
  end

  def max
    max_store.last
  end

  def min
    min_store.last
  end

  private
  attr_reader :store, :max_store, :min_store
end

class StackQueue
  def initialize
    @pop_stack = MyStack.new
    @push_stack = MyStack.new
  end

  def enqueue(element)
    push_stack.push(element)
  end

  def dequeue
    if pop_stack.empty?
      pop_stack.push(push_stack.pop) until push_stack.empty?
    end

    pop_stack.pop
  end

  def size
    pop_stack.size + push_stack.size
  end

  def empty?
    push_stack.empty? && pop_stack.empty?
  end

  private
  attr_reader :push_stack, :pop_stack
end

class MinMaxStackQueue < StackQueue
  def max
    return pop_stack.max if push_stack.empty?
    return push_stack.max if pop_stack.empty?
    [push_stack.max, pop_stack.max].max
  end

  def min
    return pop_stack.min if push_stack.empty?
    return push_stack.min if pop_stack.empty?
    [push_stack.min, pop_stack.min].min
  end
end
