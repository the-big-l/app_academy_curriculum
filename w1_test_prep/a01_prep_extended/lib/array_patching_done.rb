require 'byebug'
class Array

  def my_each(&prc)
    size.times do |i|
      prc.call(self[i])
    end
  end

  def my_each_with_index(&prc)
    size.times do |i|
      prc.call(self[i], i)
    end
  end

  def my_select(&prc)
    res = []

    each do |el|
      res << el if prc.call(el)
    end

    res
  end

  def my_reject(&prc)
    res = []

    each { |el| res << el unless prc.call(el) }

    res
  end

  def my_any?(&prc)
    each { |el| return true if prc.call(el) }
    false
  end

  def my_all?(&prc)
    each { |el| return false unless prc.call(el) }
    true
  end

  # Takes a multi-dimentional array and returns a single array of all the elements
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,5]
  def my_flatten
    return self if none? { |el| el.is_a?(Array) }
    res = []

    each do |el|
      res += el.is_a?(Array) ? el.my_flatten : [el]
    end

    res
  end

  # Write a version of flatten that only flattens n levels of an array.
  # E.g. If you have an array with 3 levels of nested arrays, and run
  # my_flatten(1), you should return an array with 2 levels of nested
  # arrays
  #
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,[5]]
  def my_controlled_flatten(n)
    return self if n.zero?
    res = []

    each do |el|
      res += el.is_a?(Array) ? el.my_controlled_flatten(n - 1) : [el]
    end

    res
  end

  def my_zip(*arrs)
    res = Array.new(size) { [] }

    size.times do |i|
      res[i] << self[i]
      arrs.each do |arr|
        res[i] << arr[i]
      end
    end

    res
  end

  def my_rotate(num = 1)
    mod = num % size
    res = dup

    mod.times { res.push(res.shift) }

    res
  end

  def my_join(str = '')
    res = ''
    each_with_index do |char, i|
      res += (i == size - 1 ? char : (char + str))
    end
    res
  end

  def my_reverse
    res = []

    each do |el|
      res.unshift(el)
    end

    res
  end

  # Write a monkey patch of quick sort that accepts a block
  def my_quick_sort(&prc)
    return self if size <= 1
    prc ||= proc { |x, y| x <=> y}

    pivot = shift
    left = select { |el| prc.call(el, pivot) < 1 }
    right = select { |el| prc.call(el, pivot) == 1}

    left.my_quick_sort(&prc) + [pivot] + right.my_quick_sort(&prc)
  end

  # Write a monkey patch of binary search that accepts a comparison block:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(6) {|el, targ| el+1 <=> targ} => 4
  def my_bsearch(target, &prc)
    prc ||= proc { |x, y| x <=> y }
    return nil if empty?

    mid = size / 2
    left, right = self[0...mid], self[mid+1..-1]

    case prc.call(self[mid], target)
    when 0
      mid
    when -1
      right_search = right.my_bsearch(target, &prc)
      right_search.nil? ? nil : right_search + mid + 1
    when 1
      left.my_bsearch(target, &prc)
    end
  end

end
