def sum_to(n)
  return nil if n < 0
  return n if n <= 1
  n + sum_to(n - 1)
end

sum_to(5)  # => returns 15
sum_to(1)  # => returns 1
sum_to(9)  # => returns 45
sum_to(-8)  # => returns nil

def add_numbers(arr)
  return nil if arr.empty?
  return arr.first if arr.size == 1

  arr.pop + add_numbers(arr)
end
add_numbers([1,2,3,4]) # => returns 10
add_numbers([3]) # => returns 3
add_numbers([-80,34,7]) # => returns -39
add_numbers([]) # => returns nil

def gamma_fnc(n)
  # x = n - 1
  return nil if n.zero?
  return 1 if n == 1

  gamma_fnc(n - 1) * (n - 1)
end
gamma_fnc(0)  # => returns nil
gamma_fnc(1)  # => returns 1
gamma_fnc(4)  # => returns 6
gamma_fnc(8)  # => returns 5040
