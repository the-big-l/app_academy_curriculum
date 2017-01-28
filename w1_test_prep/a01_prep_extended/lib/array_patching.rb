require 'byebug'
class Array

  def my_each(&prc)
    size.times do |i|
      prc.call(self[i])
    end
    self
  end

  def my_each_with_index(&prc)
    size.times do |i|
      prc.call(self[i], i)
    end

    self
  end

  def my_select(&prc)
    result = []

    my_each { |el| result << el if prc.call(el) }

    result
  end

  def my_reject(&prc)
    result = []

    my_each { |el| result << el unless prc.call el }

    result
  end

  def my_any?(&prc)
    my_each { |el| return true if prc.call(el) }

    false
  end

  def my_all?(&prc)
    my_each { |el| return false unless prc.call(el) }

    true
  end

  # Takes a multi-dimentional array and returns a single array of all the elements
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,5]
  def my_flatten
    return [self] unless is_a?(Array)

    result = []

    each { |el|  result += (el.is_a?(Array) ? el.my_flatten : [el]) }

    result
  end

  # Write a version of flatten that only flattens n levels of an array.
  # E.g. If you have an array with 3 levels of nested arrays, and run
  # my_flatten(1), you should return an array with 2 levels of nested
  # arrays
  #
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,[5]]
  def my_controlled_flatten(n)
    return [self] unless is_a?(Array)
    result = []

    n.times do
      each do |el|
         if el.is_a?(Array)
           el.each { |el| result << el}
         else
           result << el
         end
       end
    end

    result
  end

  def my_zip(*arrs)
    result = []

    each_with_index do |el, i|
      result << [el]
      arrs.each { |el| result[i] << el[i] }
    end

    result
  end

  def my_rotate(num = 1)
    a = dup
    if num > 0
      num.times { a.push(a.shift) }
    elsif num < 0
      num.abs.times { a.unshift(a.pop) }
    end

    a
  end

  def my_join(str = '')
    result = ''

    each_with_index do |el, i|
      result += (i == size - 1 ? el : el + str)
    end

    result
  end

  def my_reverse
    result = []

    each { |el| result.unshift(el) }

    result
  end

  # Write a monkey patch of quick sort that accepts a block
  def my_quick_sort(&prc)
    return self if uniq.size <= 1
    prc ||= proc { |x, y| x <=> y }

    left = select { |el| el < first }
    pivot = select { |el| el == first }
    right = select { |el| el > first }

    sorted = left.my_quick_sort + pivot + right.my_quick_sort

    case prc.call(1, 2)
    when -1
      sorted
    when 0
      sorted
    when 1
      sorted.reverse
    end
  end

  # Write a monkey patch of binary search that accepts a comparison block:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(6) {|el, targ| el+1 <=> targ} => 4
  def my_bsearch(target, &prc)
    return nil if empty?

    prc ||= proc { |x, y| x <=> y }

    mid = size / 2

    left, right = self[0...mid], self[mid - 1..-1]

    case prc.call(n, target)
    when -1
      left.bsearch(target, &prc)
    when 0
      mid
    when 1
      right.besearch(target, &prc) + left.size + 1
    end
  end

end
