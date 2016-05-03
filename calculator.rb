### Challenge 1 - Calculator

# Create a simple calculator that first asks the user what method they would 
# like to use (addition, subtraction, multiplication, division) and then asks 
# the user for two numbers, returning the result of the method with the two 
# numbers. Here is a sample prompt:

# What calculation would you like to do? (add, sub, mult, div)
# add
# What is number 1?
# 3
# What is number 2?
# 6
# Your result is 9

###########################################
## get_op: Gets user input for operation ##
###########################################
def get_op
  puts "What calculation would you like to do? (add, sub, mult, div):"
  op = gets.chomp
  checked = false
  while not checked do
    if ['add', 'sub', 'mult', 'div'].include? op
      checked = true
    else
      puts "I didn't understand what you entered.  Please type exactly one of the following: 'add', 'sub', 'mult', or 'div':"
      op = gets.chomp
    end
  end
  op
end

##########################################
## get_op: Gets user input for numbers. ##
## Takes argument n to display to user  ##
## which number this is.                ##
##########################################
def get_num(n)
  checked = false
  while not checked do
    puts "What is number #{n}?"
    str_x = gets.chomp
    if str_x == "0" || str_x.to_f != 0
      x = str_x.to_f
      checked = true
    else
      puts "I don't understand that as a number.  Let's try again with a number. (Try to avoid spaces, 0.0, or funny stuff like that.)"
    end
  end
  x
end

#######################################
## run_op: Runs a given operation on ##
## arguments x and y.                ##
#######################################
def run_op(op, x, y)
  if op == 'add'
    ans = x + y
  elsif op == 'sub'
    ans = x - y
  elsif op == 'mult'
    ans = x * y
  elsif op == 'div'
    begin
      ans = x / y
    rescue ZeroDivisionError
      puts "Naughty, naughty, looks like you tried to divide by zero."
    end
  end
  ans
end

###########################
##       Main loop       ##
###########################
running = true
while running do
  op = get_op
  x = get_num(1)
  y = get_num(2)
  ans = run_op(op, x, y)
  puts "Your result is #{ans}"
  puts "Thanks for using the caluculator.  Press any key to try again or type 'exit' to quit:"
  if gets.chomp == 'exit'
    running = false
  end
end

