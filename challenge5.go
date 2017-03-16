package main

//Euler challenge5 in golang
//Challenge is to find the lowest number
// divisible evenly by all numbers 1 through 20

import "fmt"
import "os"

// We only need to look at numbers 11 through 20!
// All other numbers are 'checked' for when their double is checked.
// For example, all numbers divisible by 20 are divisible by 10
//BECAUSE 20 is the largest number we are looking for
// we incrememnt by 20 and then perform our checks to see if the numbers
//is divisible by all of the other numbers
func findSmallest(){
	i := 20;
	x := 11;
	divs := 0;
	for {
		for x < 21 {
			if i%x != 0 {
				divs = divs + 1;
			}
			if divs == 0 && x == 20 {
				fmt.Println("The lowest common number is :");
				fmt.Println(i);
				os.Exit(3);
			}
			x = x + 1;
		}
		divs = 0;
		x = 11;
		fmt.Println(i);
		i = i + 20;
	}
}

// Kicks off the program
func main(){
	fmt.Println("The program will now start");
	findSmallest();
}
