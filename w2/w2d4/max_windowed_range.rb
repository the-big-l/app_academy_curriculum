# O(n**2)
def naive_windowed_max_range(array, window_size)
  current_max_range = nil
  array.each_cons(window_size) do |window| # n
    current_range = window.max - window.min # 2n
    current_max_range = current_range if current_max_range.nil?
    current_max_range = current_range if current_range > current_max_range
  end
  current_max_range
end
