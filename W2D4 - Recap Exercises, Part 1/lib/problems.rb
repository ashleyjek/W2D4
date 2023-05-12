# Write a method, all_vowel_pairs, that takes in an array of words and returns
# all pairs of words that contain every vowel. Vowels are the letters a, e, i,
# o, u. A pair should have its two words in the same order as the original
# array. 
#
# Example:
#
# 
require "byebug"
def all_vowel_pairs(words)
  vowels = ["a","e","i","o","u"]
  
  pairs = []
  (0...words.length).each do |idx1|
    subarr = []
    ((idx1+1)...words.length).each do |idx2|
      pairs << words[idx1] + " " + words[idx2]
    end
  end

  p pairs
  answer = []

  pairs.each do |ele|
    if vowels.all? {|v| ele.include?(v) }
      answer << ele
    end
  end
  answer
end

p all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"]) # => ["action europe", "tear impromptu"]

# Write a method, composite?, that takes in a number and returns a boolean
# indicating if the number has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true composite?(13)    # => false
def composite?(num)
  (2...num).each do |factor|
    if num % factor == 0
      return true
    end
  end
  false
end



# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the order of their appearance in the
# original array.
#
# Examples:

def find_bigrams(str, bigrams)
  sent = str.split("")
  # p sent
  new_sent = []
  i = 0
  while i < sent.length - 1
    new_sent << sent[i] + sent[i+1]
    i += 1

  end
  answer = []
  bigrams.each do |pair|
    if new_sent.include?(pair)
      answer << pair
    end

  end
  answer

end

p find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
p find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]



# Write a method, Hash#my_select, that takes in an optional proc argument
# The method should return a new hash containing the key-value pairs that return
# true when passed into the proc.
# If no proc is given, then return a new hash containing the pairs where the key
# is equal to the value.
#
# Examples:
#
class Hash

  def my_select(&prc)
    prc ||= Proc.new { |k, v| k == v }
    
    answer = {}
    self.each do |k, v|
      if prc.call(k, v)
        answer[k] = v
      end
    end
    answer

  end

  
end

hash_1 = {x: 7, y: 1, z: 8}
p hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}

hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
p hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
p hash_2.my_select                            # => {4=>4}

# Write a method, String#substrings, that takes in a optional length argument
# The method should return an array of the substrings that have the given length.
# If no length is given, return all substrings.
#

class String
    def substrings(length = nil)
      new_arr = []
      (0...self.length).each do |idx1|
        (idx1...self.length).each do |idx2|
          new_arr << self[idx1..idx2]
        end
      end
      answer = []
      new_arr.each do |sub|
        if length == nil
          return new_arr
          
        elsif sub.length == length
          answer << sub
        end
      end
        answer
    end
end

p "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
p "cats".substrings(2)  # => ["ca", "at", "ts"]


# Write a method, String#caesar_cipher, that takes in an a number.
# The method should return a new string where each char of the original string
# is shifted the given number of times in the alphabet.
#

#

class String
  def caesar_cipher(num)
  sent = self.split("")
  alpha = ("a".."z").to_a
  new_word = ""
  sent.each do |char|
    old_idx = alpha.index(char)
    new_idx = old_idx + num
    new_word += alpha[new_idx % 26]
  end
      
  return new_word

  end
end


p "apple".caesar_cipher(1)    #=> "bqqmf"
p "bootcamp".caesar_cipher(2) #=> "dqqvecor"
p "zebra".caesar_cipher(4)    #=> "difve"