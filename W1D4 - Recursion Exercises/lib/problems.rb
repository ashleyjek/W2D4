# Write a method, pow(base, exponent), that takes in two numbers.
# The method should calculate the base raised to the exponent power.
# You can assume the exponent is always positive.
#
# Solve this recursively!
#
def pow(base, exp)
    if exp == 0
        return 1
    elsif exp == 1
        return base
    end

    base * pow(base, exp - 1)

    
end


pow(2, 0) # => 1
pow(2, 1) # => 2
pow(2, 5) # => 32
pow(3, 4) # => 81
pow(4, 3) # => 64


# Write a method, lucas_number(n), that takes in a number.
# The method should return the n-th number of the Lucas Sequence.
# The 0-th number of the Lucas Sequence is 2.
# The 1-st number of the Lucas Sequence is 1
# To generate the next number of the sequence, you add up the previous two 
# numbers.
#
# For example, the sequence begins: 2, 1, 3, 4, 7, 11, ...
#
# Solve this recursively!



def lucas_number(n)
    if n == 0
        return 2
    elsif n == 1
        return 1
    end

    lucas_number(n - 1) + lucas_number(n - 2)

end


lucas_number(0)   # =>    2
lucas_number(1)   # =>    1
lucas_number(2)   # =>    3
lucas_number(3)   # =>    4
lucas_number(5)   # =>    11
lucas_number(9)   # =>    76

# Write a method, sum_array(array), that takes in an array of numbers.
# The method should return the total sum of the elements.
# 
# Solve this recursively!

def sum_array(array)
  if array == []
    return 0
  elsif array.length == 1
    return array[0]
  end
  
  array.pop + sum_array(array)

end

sum_array([])             # => 0
sum_array([5])            # => 5
sum_array([5, 2])         # => 7
sum_array([4, 10, -1, 2]) # => 15


# Write a method, reverse_string(str), that takes in a string.
# The method should return the string with its characters in reverse order.
#
# Solve this recursively!

def reverse_string(str)

    if str == ""
        return str
    elsif str.length == 1
        return str
    end

    chars = str.split("")
    char = chars.pop
    new_str = chars.join("")
    return char + reverse_string(new_str)

end

p reverse_string("")            # => ""
p reverse_string("c")           # => "c"
p reverse_string("internet")    # => "tenretni"
p reverse_string("friends")     # => "sdneirf"

# A 1-dimensional array is also known as a flattened array.
# Write a method, flatten(data), that accepts a single argument. The
# method should take in an array of any dimension and return the flattened
# version of that array. Solve this recursively.
#   
# Hint:
#  - if the argument is not an array, then you have reached the base case
#  - look up the documentation for how to check if data is an array or not
# Another Hint:
#
# That last example might be confusing because it passes in a string instead of
# an array. If data is not an array, then you can consider it as a 0-dimensional
# array.
#
#     0-dimensional array: 'some data'
#     1-dimensional array: ['some data']
#     2-dimensional array: [['some data']]
#     3-dimensional array: [[['some data']]]

def flatten(data)

    if !data.is_a?(Array)
        return [data]
    end

    final = []
    data.each do |ele|
        final += flatten(ele)
    end

    final
    
end


array_1 = [1, 2, [[3, 4], [5, [6]]], [7, 8]]
p flatten(array_1)      # => [ 1, 2, 3, 4, 5, 6, 7, 8 ]

array_2 = ['this', ['problem', 'is'], [['pretty', 'tough'], [[':)']]]]
p flatten(array_2)      # => [ 'this', 'problem', 'is', 'pretty', 'tough', ':)' ]
p flatten('base case')  # => [ 'base case' ]