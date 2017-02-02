# O(n**2)
def bad_two_sum?(array, target)
  array.each_with_index do |el1, i1|
    array.each_with_index do |el2, i2|
      next if i1 == i2
      return true if el1 + el2 == target
    end
  end
  false
end

# O(nlog(n))
def okay_two_sum?(array, target)
  array.sort! # nlog(n)

  array.each_with_index do |el, i| # n
    return true if bsearch(array[i+1..-1], target - el) # log(n)
  end
  false
end

def bsearch(array, target)
  return nil if array.empty?

  mid = array.size / 2
  left = array[0...mid]
  right = array[mid + 1..-1]

  case array[mid] <=> target
  when 0
    mid
  when -1
    right_search = bsearch(right, target)
    right_search.nil? ? nil : right_search + mid + 1
  when 1
    bsearch(left, target)
  end
end

# O(n)
def two_sum?(array, target)
  elements = Hash[array.zip(array)] # n

  elements.each_key do |key| # n
    next if target - key == key
    return true if elements[target - key]
  end

  false
end
