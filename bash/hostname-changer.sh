#!/bin/bash
#
# This script is for the bash lab on variables, dynamic data, and user input
# Download the script, do the tasks described in the comments
# Test your script, run it on the production server, screenshot that
# Send your script to your github repo, and submit the URL with screenshot on Blackboard

# Get the current hostname using the hostname command and save it in a variable

# Tell the user what the current hostname is in a human friendly way

# Ask for the user's student number using the read command

# Use that to save the desired hostname of pcNNNNNNNNNN in a variable, where NNNNNNNNN is the student number entered by the user

# If that hostname is not already in the /etc/hosts file, change the old hostname in that file to the new name using sed or something similar and
#     tell the user you did that
#e.g. sed -i "s/$oldname/$newname/" /etc/hosts

# If that hostname is not the current hostname, change it using the hostnamectl command and
#     tell the user you changed the current hostname and they should reboot to make sure the new name takes full effect
#e.g. hostnamectl set-hostname $newname


oldhostname=$(hostname)

echo "The current hostname for this computer is '$oldhostname'"

read -p "Please enter you student number: " studentid

newhostname="pc$studentid"

echo ""

sudo sed -i "s/$oldhostname/$newhostname/" /etc/hosts && echo "Changed entry in the host file. '/etc/hosts'"
echo ""

currenthostname=$(grep $oldhostname /etc/hostname)

if ! [ $currenthostname==$newhostname ]; then
  sudo hostnamectl set-hostname $newhostname && echo "The hostname has now been changed to $newhostname. Please reboot your computer for changes to take full effect."
else
  echo "hostname is already set to $currenthostname, no changes have been made."

fi



