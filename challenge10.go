package main

//Project Euler Challenge 10
//Find the sum of all prime numbers below 2 million
//Program works! answer is 142913828922
//However, in its current state it is incredibly slow.  took well over 10 minutes to run.


import "fmt"


// Function assumes that the number is prime
// If found to be otherwise, variable is set to zero and we break immediately
func fullCheck(currentnum int)int{
	isprime := 1;
	for i:=2;i<currentnum;i++ {
		if (currentnum%i == 0){
			isprime = 0;
			break;
		}
	}
	return isprime;
}

// Function will loop through all numbers in bignum and find primes
// Starting at 2 because all numbers are divisible by one
func loopForPrime(bignum int){
	summation := 0;
	for i:=2;i<bignum;i++ {
		isprime := fullCheck(i);
		if (isprime == 1){
			fmt.Println(i);
			summation = summation + i;
		}
	}
	fmt.Println("The sum of all prime numbers below the given number is: ");
	fmt.Println(summation);
}

//  Main function for program
func main(){
	loopForPrime(2000000);
}
