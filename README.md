# Assembly-Language-Programming-CSE-214
This is the assembly language course CSE 214 of BUET,CSE in L-2,T-2

# Project (Rapid Roll) Demonstration
https://youtu.be/8NwturdxzrY

# How to run the program

## Install DOSBox from the link below according	to your OS
http://www.dosbox.com/download.php?main=1

## Create	a	folder in	C: drive in	windows, rename	it “dosprogs”	 
For Ubuntu/Mac it is	created	in home folder of	the	user

## Copy	the	provided “tasm”	folder to	the	“dosprogs” folder	created earlier


## Start DOSBox. Write the command for respected OS in DOSBox	command	window:

Windows:	mount	c	C:\dosprogs

Ubuntu/Mac:	mount	c	~\dosprogs

## Now type the following command in	the	DOSBox command window and	press	enter
C:

## Then type the following command
cd tasm\BIN

## Copy	the	GAME.asm file in to the tasm\BIN folder.	

## Execute the following command in the DOSBox command window
tasm /I/zi GAME.asm

## Then type the following command
tlink	GAME.obj io.obj

## Finally type the following command and press enter to run the game
GAME.exe 
