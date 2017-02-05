require 'set'

class WordChainer
  ALPHABET = ("a".."z").to_set

  def initialize(dictionary = "dictionary.txt")
    @dictionary = File.readlines(dictionary).map(&:chomp).to_set
  end

  def adjacent_words(word)

    result = []

    ALPHABET.each do |letter|
      word.length.times do |i|
        candidate = word.chars.map.with_index do |char, j|
          i == j ? letter : char
        end.join

        result << candidate if @dictionary.include?(candidate)
      end
    end

    result.delete(word)
    result
  end

  def run(source, target)
    @current_words = [source]
    @all_seen_words = [source]

    while @current_words.any?
      while
        new_current_words =   []
        @current_words.each do |current_word|
          adjacent_words(current_word).each do |adjacent_word|
            unless @all_seen_words.include?(adjacent_word)
              new_current_words << adjacent_word
              @all_seen_words << adjacent_word
            end
          end
        end

        @current_words.replace(new_current_words)
      end

    end
  end

end
