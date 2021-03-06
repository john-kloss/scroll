#!/bin/bash

scrollArray=(0)
declare -i position=0

echo "Choose song"
echo "[1] Bellas Finals"
echo "[2] Paradise"
echo "[3] Say Something"

read chosenSong

if [ "$chosenSong" = "1" ]; then
	scrollArray=(2 10 14 10 15 10 15 10 15 10 15 10 15 10 15 10 15 10 15 9 15 10 15 10 15 9 16 10 15 10 15 10 15 10 15 10 15 10 15 
			9 16 9 15 10 16 0) #fs
fi

if [ "$chosenSong" = "2" ]; then
	scrollArray=(4 17 16 13 12 13 12 13 12 13 12 13 12 13 12 13 0) #fullscreen
fi

if [ "$chosenSong" = "3" ]; then
	scrollArray=(1 12 9 7 7 9 7 7 9 7 7 9 7 7 9 7 7 8 7 0)
	scrollArrayOld=(2 12 10 8 8 9 8 8 10 7 8 9 8 8 9 8 8 9 7 0) #not fullscreen
fi



#scrolling functions
scrollDown(){
  for (( c=1; c<=$1; c++ ))
  do
	  xdotool key Down
  done
}

scrollUp(){
  for (( c=1; c<=$1; c++ ))
  do
	  xdotool key Up
  done
}
###

echo "initiation complete"

while true
do
	read input
	
	#keep position in scrollarray
	if [ "$position" -lt "0" ]; then
		position=0
	fi

	if [ "$position" -eq "${#scrollArray[@]}" ]; then
		position=$position-1
	fi
	###
	

	#scroll
	if [ "$input" = "f" ]; then
		scrollDown ${scrollArray[$position]}
		position=position+1
	fi
	
	if [ "$input" = "b" ]; then
		scrollUp ${scrollArray[$position-1]}
		position=position-1
	fi 
	if [ "$input" = "r" ]; then
		position=0
		xdotool key Home
	fi 
	echo "$position"
	wait
	###
	
done


