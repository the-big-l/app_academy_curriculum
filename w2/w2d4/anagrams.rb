# O(n!)
def first_anagram?(string1, string2)
  perms = string1.chars.permutation.map(&:join) # n!

  perms.include?(string2) # n
end

# O(n)
def second_anagram?(string1, string2)
  string1.each_char { |l| string2.slice!(l) } # 2n
  string2.each_char { |l| string1.slice!(l) } # 2n

  string1.empty? && string2.empty?
end

# O(nlog(n))
def third_anagram?(string1, string2)
  string1.sort == string2.sort # nlog(n)
end

# O(n)
def fourth_anagram?(string1, string2)
  letter_count = Hash.new(0)
  string1.each_char { |l| letter_count[l] += 1} # n
  string2.each_char { |l| letter_count[l] -= 1} # n

  letter_count.values.all?(&:zero?) # 2n
end
