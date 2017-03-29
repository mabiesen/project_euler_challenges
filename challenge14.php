<?php
// Project Euler Challenge 14
// Find the longest Collatz sequence for numbers under 1M

//A collatz sequence starts with a given number
// Depending on whether the number is odd or even, conduct one of the functions below
// n → n/2 (n is even)
// n → 3n + 1 (n is odd)
// The process is repeated with the resulting number
// According to the theory, using this method all numbers will eventually reduce to one


//main function of the program
//loops through numbers 1 to 1 million performing collatz on each number
function main(){
	$highestcount = 0;
	$highestnumber = 0;

	for($i=1; $i<=1000000; $i++){
		$currentnum = $i;
		$currentcount = 0;

		while($currentnum != 1){
			$currentnum = collatz($currentnum);
			$currentcount++;
		}
		if($currentcount > $highestcount){
			$highestnumber = $i;
			$highestcount = $currentcount;
		}
		$currentcount = 0;
	}
	echo("Number: " . $highestnumber . "\n");
	echo("Count: " . $highestcount . "\n");
}

// Function to express the collatz theory
function collatz($number){
	$newnumber = 0;
	if($number%2 == 0){
		$newnumber = $number/2;
	} else {
		$newnumber = $number*3 +1;
	}
	return $newnumber;
}

main()


 ?>
