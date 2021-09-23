#!/bin/bash
#
# this script rolls a pair of six-sided dice and displays both the rolls
#

# Task 1:
#  put the number of sides in a variable which is used as the range for the random number
#  put the bias, or minimum value for the generated number in another variable
#  roll the dice using the variables for the range and bias i.e. RANDOM % range + bias

echo "Task 1"
echo "Rolling now..."

range=6
bias=1
roll1=$(( RANDOM % $range + $bias))
roll2=$(( RANDOM % $range + $bias))

echo "Rolled $roll1, $roll2"


# Task 2:
#  generate the sum of the dice
#  generate the average of the dice

sum=$(($roll1 + $roll2))
avg=$(($roll1 + $roll2 / 2))

echo "You rolled a rolled a total of $sum"

echo "The average is $avg"



#  display a summary of what was rolled, and what the results of your arithmetic were

# Tell the user we have started processing
echo "Rolling..."
# roll the dice and save the results
die1=$(( RANDOM % 6 + 1))
die2=$(( RANDOM % 6 + 1 ))
# display the results
echo "Rolled $die1, $die2"
