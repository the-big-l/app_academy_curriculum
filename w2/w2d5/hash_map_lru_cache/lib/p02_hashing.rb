class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return 999.hash if self.empty?
    hash_value = 0
    self.each_with_index do |num, i|
       hash_value += num.hash / (i + 1) % 100
     end

     hash_value / self.size
  end
end

class String
  def hash
    hash_value = 0

    self.split('').each_with_index do |letter, i|
      hash_value += letter.ord.hash / (i + 1) % 26
    end

    hash_value / self.length
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    return 9999.hash if self.empty?
    hash_value = 0

    self.each do |key, value|
      hash_value += key.hash / 10
      hash_value += value.hash / 20
    end

    hash_value / (self.size * 2)
  end
end
