### Challenge 3 - Bank Transactions

# Create a prompt that asks the user if they would like to display their 
# balance, withdraw or deposit. Write three methods to perform these 
# calculations and output the result to the user. Here is a sample output:

# Your current balance is
# 4000
# What would you like to do? (deposit, withdraw, check_balance)
# deposit
# How much would you like to deposit?
# 1000
# Your current balance is 5000
# Are you done?
# yes
# Thank you!



###########################################
## get_op: Gets user input for operation ##
###########################################
def get_op
  puts "Enter the command you want to perform: ('dep' = deposit, 'wit' = withdraw, 'chk' = check_balance):"
  op = gets.chomp
  checked = false
  while not checked do
    if ['dep', 'wit', 'chk'].include? op
      checked = true
    else
      puts "I didn't understand what you entered.  Please type exactly one of the following: 'dep', 'wit', or 'chk':"
      op = gets.chomp
    end
  end
  op
end

##########################################
## deposit: Gets user input for numbers. ##
## Takes argument n to display to user  ##
## which number this is.                ##
##########################################
def mod(balance, op)
  op_str = op == 'dep' ? 'deposit' : 'withdraw' 
  checked = false
  while not checked do
    puts "How much would you like to #{op_str}?"
    str_x = gets.chomp
    if str_x == "0" || str_x.to_f != 0
      x = str_x.to_f
      checked = true
    else
      puts "I don't understand that as a number.  Let's try again with a number. (Try to avoid spaces, 0.0, or funny stuff like that.)"
    end
  end
  case op
  when 'dep' then balance += x
  when 'wit' then balance -= x
  end
  puts "Your current balance is #{balance}"
  return balance
end

#######################################
## withdraw: Runs a given operation on ##
## arguments x and y.                ##
#######################################
def withdraw
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


#######################################
## withdraw: Runs a given operation on ##
## arguments x and y.                ##
#######################################
def run_op(balance, op)
  if op == 'chk'
    puts "Your current balance is #{balance}"
  else
    balance = mod(balance, op)
  end
  return balance
end

###########################
##       Main loop       ##
###########################
balance = 0
running = true
while running do
  op = get_op
  balance = run_op(balance, op)
  puts "Press any key to go again or type 'exit' to quit:"
  if gets.chomp == 'exit'
    running = false
  end
end