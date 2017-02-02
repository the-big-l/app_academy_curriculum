# O(n**2)
def my_min_one(array)
  result = array.first
  array.each do |el1| # n
    array.each do |el2| # n
      min = (el1 > el2 ? el2 : el1)
      result = min if result > min
    end
  end
  result
end

# O(n)
def my_min_two(array)
  result = array.first
  array.drop(1).each do |el| # n
    result = el if el < result
  end
  result
end

# O(n**3)
def largest_contiguous_subsum_one(array)
  subs = []
  1.upto(array.size) do |len| # n
    (array.size - len + 1).times do |i| # n
      subs << array[i, len] # n
    end
  end

  subs.max_by { |sub| sub.inject(:+) }.inject(:+) # n ** 3
end

# O(n)
def largest_contiguous_subsum_two(array)
  # return array.max if array.all? { |n| n.negative? } # 2n

  max_sum = array.first
  current_sum = array.first
  array.drop(1).each do |n| # n
    current_sum = 0 if current_sum < 0
    current_sum += n
    max_sum = current_sum if current_sum > max_sum
  end
  max_sum
end
