#!/bin/bash
# This is a script to practice doing testing in bash scripts

# This section demonstrates file testing

# Test for the existence of the /etc/resolv.conf file
# TASK 1: Add a test to see if the /etc/resolv.conf file is a regular file
# TASK 2: Add a test to see if the /etc/resolv.conf file is a symbolic link
# TASK 3: Add a test to see if the /etc/resolv.conf file is a directory
# TASK 4: Add a test to see if the /etc/resolv.conf file is readable
# TASK 5: Add a test to see if the /etc/resolv.conf file is writable
# TASK 6: Add a test to see if the /etc/resolv.conf file is executable
test -e /etc/resolv.conf && echo "/etc/resolv.conf exists" || echo "/etc/resolv.conf does not exist"

file="/etc/resolv.conf"

  test -f $file && echo "...IS a regular file." || echo "...is NOT a regular file"
  test -h $file && echo "...IS a symoblic link" || echo "...is NOT a symbolic link"
  test -d $file && echo "...IS a directory" || echo "...is NOT a directory"
  test -r $file && echo "...IS readable" || echo "...is NOT readable"
  test -w $file && echo "...IS writable" || echo "...is NOT writable"
  test -x $file && echo "...IS executable" || echo "...is NOT executable"

# Tests if /tmp is a directory
# TASK 4: Add a test to see if the /tmp directory is readable
# TASK 5: Add a test to see if the /tmp directory is writable
# TASK 6: Add a test to see if the /tmp directory can be accessed
echo ""

file="/tmp"


[ -e $file ] && echo "$file exists" || echo "$file does not exist."
[ -d $file ] && echo "... IS a directory." || echo "... is NOT a directory."
[ -r $file ] && echo "... IS a readable." || echo "... is NOT a readable."
[ -w $file ] && echo "... IS a writable." || echo "... is NOT a writable."
[ -x $file ] && echo "... IS executable." || echo "...is NOT a executable."


# Tests if one file is newer than another
# TASK 7: Add testing to print out which file newest, or if they are the same age
echo ""

[ /etc/hosts -nt /etc/resolv.conf ] && echo "/etc/hosts is newer" || echo "/etc/resolv.conf is newer."
[ /etc/hosts -ot /etc/resolv.conf ] && echo "/etc/resolv.conf is newer" || echo "etc/hosts is newer"
[ ! /etc/hosts -nt /etc/resolv.conf -a ! /etc/hosts -ot /etc/resolv.conf ] && echo "/etc/hosts is the same age as /etc/resolv.conf"

# this section demonstrates doing numeric tests in bash

# TASK 1: Improve it by getting the user to give us the numbers to use in our tests
# TASK 2: Improve it by adding a test to tell the user if the numbers are even or odd
# TASK 3: Improve it by adding a test to tell the user is the second number is a multiple of the first number

read -p "Please pick a first number: " firstNumber
read -p "Please pick a second number: " secondNumber

[ $firstNumber -eq $secondNumber ] && echo "The two numbers are the same"
[ $firstNumber -ne $secondNumber ] && echo "The two numbers are not the same"
[ $firstNumber -lt $secondNumber ] && echo "The first number is less than the second number"
[ $firstNumber -gt $secondNumber ] && echo "The first number is greater than the second number"

[ $firstNumber -le $secondNumber ] && echo "The first number is less than or equal to the second number"
[ $firstNumber -ge $secondNumber ] && echo "The first number is greater than or equal to the second number"

if [ $((firstNumber%2)) -eq 0 ]
then
  echo "The First number is even"
else
  echo "The first number is odd"
fi

if [ $((secondNumber%2)) -eq 0 ]
then
  echo "The second number is even"
else
  echo "The second number is odd"
fi

# This section demonstrates testing variables

# Test if the USER variable exists
# TASK 1: Add a command that prints out a labelled description of what is in the USER variable, but only if it is not empty
# TASK 2: Add a command that tells the user if the USER variable exists, but is empty
[ -v USER ] && echo "The variable SHELL exists"

[ -z USER ] && echo" The variable is empty." || echo "The variable contains '$USER'"

# Tests for string data
# TASK 3: Modify the command to use the != operator instead of the = operator, without breaking the logic of the command
# TASK 4: Use the read command to ask the user running the script to give us strings to use for the tests
a=1
b=01
[ $a != $b ] && echo "$a is not alphanumerically equal to $b" || echo "$a is alphanumerically equal to $b"
