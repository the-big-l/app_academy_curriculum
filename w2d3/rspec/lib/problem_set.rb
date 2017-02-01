class Array
  def my_uniq
    res = []
    each { |el| res << el unless res.include?(el) }

    res
  end

  def two_sum
    res = []
    self.each_index do |i1|
      next if i1 == size - 1
      (i1 + 1...size).each do |i2|
        res << [i1, i2] if self[i1] + self[i2] == 0
      end
    end
    res
  end

  def my_transpose
    raise "Invalid array" unless self[0].is_a?(Array)
    res = Array.new(self[0].size) { [] }
    each do |row|
      row.each_with_index do |el, col|
        res[col] << el
      end
    end

    res
  end

  def stock_picker
    res = [] 
    max = 0
      self.each_index do |i1|
        next if i1 == size - 1
        (i1 + 1...size).each do |i2|
          delta = self[i2] - self[i1]
          if delta > max
            max = delta
            res = [i1, i2]
          end
        end
      end

      res
  end
end
