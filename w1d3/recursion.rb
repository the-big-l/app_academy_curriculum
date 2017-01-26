require 'byebug'

def range(min, max)
  return [] if max < min

  range(min, max - 1) << max
end

def sum_of_array_itr(array)
  array.reduce(0, :+)
end

def sum_of_array_recursive(array)
  return array.first if array.length == 1

  array.first + sum_of_array_recursive(array[1..-1])
end

def exp(b, n)
  return 1 if n < 1
  return b if n == 1

  b * exp(b, n - 1)
end

def exp_two(b, n)
  return 1 if n < 1
  return b if n == 1

  if n.even?
    exp(b, n/2) ** 2
  else
    b * (exp(b, (n - 1) / 2) ** 2)
  end
end

class Array

  def deep_dup
    return self.dup if self.flatten == self

    self.map do |el|
      if el.is_a?(Array)
        el.deep_dup
      else
        el
      end
    end.dup
  end

end

def fibonacci(n)
  return nil if n <= 0
  return 1 if n <= 2

  fibonacci(n - 1) + fibonacci(n - 2)
end

def subsets(array)
  return [[]] if array.empty?

  prev_subs = subsets(array[0..-2])

  prev_subs + prev_subs.map { |el| el += [array.last] }
end

def permutations(array)
  return [array] if array.length == 1

  previous_perms = permutations(array[0...-1])

  result = []
  previous_perms.each do |el|
    (array.length).times do |idx|
      result << el.dup.insert(idx, array.last)
    end
  end

  result
end

# def bsearch(array, target)
  # raise "unsorted array!" unless array.sort == array
  #
  # return nil if array.empty?
  # return 0 if array[0] == target
  #
  # n = array.size
  # bottom, top = array[0...n/2], array[n/2..-1]
  #
  # if target <= bottom.last
  #   bsearch(bottom, target)
  # else
  #   bsearch(top, target) + bottom.size
  # end
# end

def bsearch(array, target)
  return nil if array.empty?

  n = array.size/2
  bottom, mid, top = array[0...n], array[n], array[n+1..-1]

  if target < array[n]
    bsearch(bottom, target)
  elsif target > array[n]
    if bsearch(top, target).nil?
      return nil
    else
      bsearch(top, target) + bottom.size + 1
    end
  else
    return array[n] == target ? n : nil
  end
end

def merge_sort(array)
  return array if array.length <= 1

  n = array.size
  bottom, top = array[0...n/2], array[n/2..-1]

  merge(merge_sort(bottom), merge_sort(top))
end

def merge(arr1, arr2)
  result = []

  until arr1.empty? && arr2.empty?
    if arr1.any? && arr2.any?
      if arr1.first < arr2.first
        result << arr1.shift
      else
        result << arr2.shift
      end
    elsif arr1.empty? && arr2.any?
      result << arr2.shift
    else
      result << arr1.shift
    end
  end

  result
end

def greedy_make_change(target, coins = [25, 10, 5, 1])
  return [target] if coins.include?(target)
  coins.sort.reverse!

  largest_coin = coins.find { |el| target > el }

  [largest_coin] + greedy_make_change(target - largest_coin, coins)
end

def make_better_change(target, coins = [25, 10, 5, 1])
  return [target] if coins.include?(target)

  result = []

  coins.each do |coin|
    result << ([coin] + make_better_change(target - coin, coins)) if target > coin
  end

  result.min_by { |pocket| pocket.size }
end
