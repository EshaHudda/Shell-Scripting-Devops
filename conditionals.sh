#!/bin/user

<<disclaimer
this is just for the learning purpose
disclaimer

read -p "Enter the girl: " person

read -p "Enter Correct %" correctness

if [[ $person == "boy" ]];
then
	echo "It is fine"
elif [[ $correctness -ge 100 ]];
then
	echo "Then it is fine"

else
	echo "It is not fine"
fi


