/* Find even fibonacci numbers less than 4m */
/*And my first C code!!!!*/

/*C code was found to be functional with gcc compiler on ubuntu linux*/

#include<stdio.h>

//Primary function to find fibonacci numbers, determine if they are even, and add as necessary
//Additionally, the code adds fib numbers to an array... the array is not used
void getfib(long a[], int size){
	long pushfib = 0;
	long tempfiba = 1;
	long tempfibc = 2;
	// Starting sum at 2 as '2' is left out of our fib loop
	long sum = 2;

	// capture first two digits of Fibonacci sequence
	a[0] = tempfiba;
	a[1] = tempfibc;
	printf("%ld\n", a[0]);
	printf("%ld\n", a[1]);

	// create fibonacci numbers
  // this loop does all the heavy lifting for this application
	for(int i=2;i<size;i++){
		pushfib = tempfiba + tempfibc;

		if (pushfib >= 4000000){
			break;
		}
		if (pushfib % 2 == 0){
			sum = sum + pushfib;
		}

		a[i] = pushfib;
		tempfiba = tempfibc;
		tempfibc = pushfib;
		printf("%ld\n", a[i]);
	}
	printf("The sum of all even Fibonacci numbers below 4m is %ld\n", sum);
}

//store variables and main and call getfib function
main()
{
	int size = 50;
	long fib[size];
    getfib(fib,size);
}
