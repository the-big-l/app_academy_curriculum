# Extend the Array class
class Array
  def my_each
    0.upto(size - 1) do |i|
      yield self[i]
    end

    self
  end

  def my_select
    selection = []
    my_each do |ele|
      selection << ele if yield(ele)
    end

    selection
  end

  def my_reject
    selection = []

    my_each do |ele|
      selection << ele unless yield ele
    end

    selection
  end

  def my_any?
    my_each do |ele|
      return true if yield ele
    end

    false
  end

  def my_all?
    my_each do |ele|
      return false unless yield ele
    end

    true
  end

  def my_flatten
    flat_array = []

    my_each do |ele|
      flat_array << pull_elements(ele) if pull_elements(ele).class != Array
      flat_array += pull_elements(ele) if pull_elements(ele).class == Array
    end

    flat_array
  end

  def pull_elements(element)
    return element unless element.class == Array
    element.my_flatten
  end

  def my_zip(*arrays)
    zipped = Array.new(size) { [] }

    each_index do |i|
      zipped[i] << self[i]
      arrays.each do |array|
        zipped[i] << array[i]
      end
    end

    zipped
  end

  def my_rotate(shift = 1)
    rotated = Array.new(size)

    each_index do |i|
      rotated[(i - shift) % size] = self[i]
    end

    rotated
  end

  def my_join(separator = '')
    string = ''

    each do |char|
      string << char + separator
    end

    separator == '' ? string : string.chop
  end

  def my_reverse
    reversed = []
    (0...size).to_a.each do |i|
      reversed.unshift(self[i])
    end
    reversed
  end
end
