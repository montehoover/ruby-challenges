### Challenge 2 - Reverse a string

# Reverse a string in place. In other words, do not create a new string or use
# other methods on the string such as `reverse`. The goal of the problem is to
# use a loop and the string accessors to figure out which values to swap for 
# other values. Below is some sample output.

# Enter a string:
# reverse_me
# em_esrever

def reverse(s)
  for i in (0...s.length/2) do
    temp = s[i]
    s[i] = s[s.length - (i + 1)]
    s[s.length - (i + 1)] = temp
  end
  s
end

running = true
while running do
  puts "Enter a word to reverse:"
  s = gets.chomp
  puts reverse s
end

# def fizz_buzz(n)
#   d =  {0 => 'fizzbuzz', 3 => 'fizz', 6 => 'fizz', 9 => 'fizz', 12 => 'fizz', 5 => 'buzz', 10 => 'buzz'}
#   (0..n).each do |i| puts d[i%15] || i end
# end

# fizz_buzz(100)