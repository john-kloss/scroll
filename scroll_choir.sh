
#!/bin/bash

scrollArray=(0)
declare -i position=0

echo "Choose song"
echo "[1] Bellas Finals"
echo "[2] Paradise"
echo "[3] Say Something"

read chosenSong

if [ "$chosenSong" = "1" ]; then
	scrollArray=(3 11 15 10 17 11 16 11 16 11 16 11 16 11 16 11 16 11 16 11 16 11 16 11 0)
fi

if [ "$chosenSong" = "2" ]; then
	scrollArray=(4 19 18 14 13 14 13 14 14 13 14 13 14 13 14 13 0)
fi

if [ "$chosenSong" = "3" ]; then
	scrollArray=(2 12 10 8 8 9 8 8 10 7 8 9 8 8 9 8 8 9 7 0)
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
	
	#keep position in array
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


