class Queue
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

class Stack
  def initialize
    @store = store
  end

  def pop
    store.pop
  end

  def push(element)
    store << element
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

class StackQueue
  def initialize
    @pop_stack = Stack.new
    @push_stack = Stack.new
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
