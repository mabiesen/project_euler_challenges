// Project Euler Challenge 12
// Find a Triangular number that has over 500 divisors

//Note: The program is very slow
//I made several modifications in the interest of increasing speed
//With little result
//1. In GetDivisors, I only assess numbers 1 through mysum/2.  I then add one to counter as mysum is divisible by itself
//2. Corrections to value types.


#include<stdio.h>

//Get the number of divisors from a given number
int GetDivisors(long long mysum){
  int ctr = 0;
	float mymod;
	long long revsum;

	//We only need to evaluate half of mysum
	mymod = mysum%2;
	revsum = mysum - mymod;

  for(long long i=1;i<=mysum;i++){
      if(mysum%i == 0){
          ctr = ctr + 1;
      }
}

    // Since we only evaluated numbers up to half the value of mynum, we must add one more for the value of mynum
    return ctr + 1;
}

//This is the main container for the program
void main(){
		int mindivisors;
    int currentdiv;
    long long currentsum;
		long long mynum;

		mynum = 1;
    currentsum = 0;
    currentdiv = 0;

		//mindivisors variable is the number of divisors we are looking for
		mindivisors = 500;
		// Call function to determine range
		// Use range to create a mynum that seems an acceptable starting search point

		// This is the main loop of the program, designed to break when we have obtained our number
		while (currentdiv < mindivisors){
        currentsum = currentsum + mynum;
        currentdiv = GetDivisors(currentsum);
				mynum = mynum + 1;
    }
    printf("result: %lld\n", currentsum);

}
