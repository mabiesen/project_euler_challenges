/* Find the 10,001st prime number */
/*And my second C code!!!!*/

/*C code was found to be functional with gcc compiler on ubuntu linux*/

#include<stdio.h>

// Inform user of program's purpose
void startDialogue(){
	printf("This program aims to find prime number based upon position\n");
	printf("For example, if I input '3' the third prime number will be returned\n");
	printf("Please provide an integer\n");
}

// Get user input: which prime are we looking for?
int getInput(){
	int number;
	scanf("%d",&number);
	printf("Your number is %d\n", number);
	return number;
}

// Quickcheck quickly gets rid of numbers divisible by 2 and 5
int quickCheck(int n){
	int maybeprime = 1;
	if (n%2==0 || n%5==0){
		maybeprime = 0;
	}
	if (n==2){
		maybeprime = 1;
	}
	return maybeprime;
}

// Run after quickCheck
// Does a complete check to see if a number is prime
int fullCheck(int n){
	int isprime = 0;
	int ctr = 0;
	for(int i=2;i<n;i++){
		if (n%i == 0){
			ctr = ctr + 1;
		}
	}
	if (ctr == 0 || n==2){
		isprime = 1;
	}
	return isprime;
}

//  Get Prime number corresponding to user input
//  Calls to quick check and full check in order to check if the number is prime
//  Note: 2 is a prime number that is divisible by 2.  Put controls in quick and full check functions
void getPrime(int startnumber){
	int x = 0;
	int n = 1;
	int maybeprime = 0;
	int isprime = 0;
	while (x < startnumber+1){
		maybeprime = quickCheck(n);
		if (maybeprime != 0){
			isprime = fullCheck(n);
			if (isprime != 0){
				x = x + 1;
				if (x == startnumber){
					printf("The prime you are looking for is %d\n", n);
				}
			}
		}
		n=n+1;
	}
}

//Main is our container function
void main()
{
	int startnumber;
	startDialogue();
	startnumber = getInput();
	getPrime(startnumber);


}
