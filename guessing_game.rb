### Challenge 4 - Guessing Game

# Create a program that asks the user to guess a number between 1 and 100. 
#Once the user guesses a number, the program should say, higher, lower, or 
#tell the user that he got the number correct.  The user should continue to 
#make guesses until he guesses correctly. Also, once the user guesses 
#correctly, the program should print the number of guesses needed to arrive
# at the correct answer. Below is sample output:

# Guess a number between 1 and 100
# 50
# The number is lower than 50.  Guess again
# 25
# The number is lower than 25.  Guess again
# 13
# The number is higher than 13.  Guess again
# 20
# The number is lower than 20.  Guess again
# 17
# The number is higher than 17.  Guess again
# 18
# The number is higher than 18.  Guess again
# 19
# You got it in 7 tries

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

#############################################
## get_guess: Gets user input for numbers. ##
## Takes argument n to display to user     ##
## which number this is.                   ##
#############################################
def get_guess
  checked = false
  while not checked do
    puts "Guess a number from 1 to 100:"
    str_x = gets.chomp
    if str_x.to_i > 0 && str_x.to_i <= 100
      x = str_x.to_i
      checked = true
    else
      puts "I don't understand that as a number between 1 and 100.  Please try again:"
    end
  end
  x
end

###########################################
## check_guess: Checks the user guess ##
##                                    ##
#######################################
def check_guess(guess, n, count)
  if guess > n
    puts "Too high.  Guess again!"
    count += 1
  elsif guess < n
    puts "Too low.  Guess again!"
    count += 1
  else
    puts "You got it in #{count} tries!"
  end
  count
end

###########################
##       Main loop       ##
###########################
n = rand(1..100)
count = 0
running = true
while running do
  guess = get_guess
  new_count = check_guess(guess, n, count)
  if count == new_count
    running = false
  else
    count = new_count
  end
end