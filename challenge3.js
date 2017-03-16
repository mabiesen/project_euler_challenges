// Project Euler Challenge 3
// Find largest prime factor in a given number

//This was also my first attempt at terminal js!!!!  Used node to run.


// Kicked off by the get number function which prompts user
// FindLargest is then called as a callback function
getNumber();

function getNumber(){
	var readline = require('readline');

	var rl = readline.createInterface({
	  input: process.stdin,
	  output: process.stdout

	});

	rl.question(">>What number should we look at?  ", function(answer) {
	   console.log(answer);
		 findLargest(answer);
	   rl.close();
	});
}

// 'i' and 'v' set to 2 initially as all numbers are divisible by 1
// divcount variable used to determine if a number is prime.  A count greater than zero is not.
// if found to be prime, we determine if it is a factor of givennumber
// if it is a factor, we print! the last number printed is the largest.
function findLargest(givennumber){
	//Starting at 2
	var i = 2;
	var v = 2;
	var divcount = 0;

	while(i<givennumber){
		i=i+1;
		divcount = 0;
		for(v=2;v<i;v++){
			if(i%v == 0){
				divcount = divcount + 1;
			}
		}
		if(divcount == 0){
			if(givennumber%i == 0){
				console.log(i + " is a prime factor!");
			}
		}
	}
}
