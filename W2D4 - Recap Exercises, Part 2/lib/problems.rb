# Write a method, least_common_multiple, that takes in two numbers and returns
# the smallest number that is a mutiple of both of the given numbers
require "byebug"
def least_common_multiple(num_1, num_2)
  multiple = num_1
  while true
    if (multiple % num_1 == 0) && (multiple % num_2 == 0)
        return multiple
    else multiple += 1
    end
  end

end

# p least_common_multiple(4, 10)

# Write a method, most_frequent_bigram, that takes in a string and returns the
# two adjacent letters that appear the most in the string.
def most_frequent_bigram(str)
  bigrams = []
  i = 0 
  while i < str.length
    bigrams << str[i..(i+1)]
  i += 1
  end
  counts = Hash.new(0)
  bigrams.each do |pair|
    counts[pair] += 1
  end
 
  counts.sort {|a, b| a[1] <=> b[1]}[-1][0]
  
  

end

# p most_frequent_bigram("gotothemoonsoonforproof")

# p most_frequent_bigram("thethrillofit")

class Hash
  # Write a method, Hash#inverse, that returns a new hash where the key-value
  # pairs are swapped
  def inverse
    new_hash = {}
    self.each do |k, v|
      new_hash[v] = k
    end
    new_hash
  end
end


class Array
  # Write a method, Array#pair_sum_count, that takes in a target number returns
  # the number of pairs of elements that sum to the given target
  def pair_sum_count(num)
    count = 0
    (0...self.length).each do |idx1|
      ((idx1+1)...self.length).each do |idx2|
        if self[idx1] + self[idx2] == num
          count += 1
        end
      end
    end

    count
  end


  # Write a method, Array#bubble_sort, that takes in an optional proc argument.
  # When given a proc, the method should sort the array according to the proc.
  # When no proc is given, the method should sort the array in increasing order.
  #
  # Sorting algorithms like bubble_sort commonly accept a block. That block
  # accepts two parameters, which represents the two elements in the array being
  # compared. If the block returns 1, it means that the second element passed to
  # the block should go before the first (i.e., switch the elements). If the
  # block returns -1, it means the first element passed to the block should go
  # before the second (i.e., do not switch them). If the block returns 0 it
  # implies that it does not matter which element goes first (i.e., do nothing).
  #
  # This should remind you of the spaceship operator! Convenient :)
  def bubble_sort(&prc)
    prc ||= Proc.new { |a, b| a <=> b}
    sorted = false
    while !sorted
    sorted = true
      (0...self.length-1).each do |idx1|
        if prc.call(self[idx1], self[idx1+1]) == 1
          self[idx1], self[idx1+1] = self[idx1+1], self[idx1]
          sorted = false
        end
      end
    end
    return self
  end
end