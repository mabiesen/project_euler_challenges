//Project Euler Challenge 8
//Find the largest product of any adjacent 13 digits in 1000 digit number


// This 1000 digit number was provided by the Euler challenge website
// Digits stored in string form due to the size of the number
// Used concatenation, though I believe newline is more ideal for speed
var bignum = "73167176531330624919225119674426574742355349194934" +
						"96983520312774506326239578318016984801869478851843" +
						"85861560789112949495459501737958331952853208805511" +
						"12540698747158523863050715693290963295227443043557" +
						"66896648950445244523161731856403098711121722383113" +
						"62229893423380308135336276614282806444486645238749" +
						"30358907296290491560440772390713810515859307960866" +
						"70172427121883998797908792274921901699720888093776" +
						"65727333001053367881220235421809751254540594752243" +
						"52584907711670556013604839586446706324415722155397" +
						"53697817977846174064955149290862569321978468622482" +
						"83972241375657056057490261407972968652414535100474" +
						"82166370484403199890008895243450658541227588666881" +
						"16427171479924442928230863465674813919123162824586" +
						"17866458359124566529476545682848912883142607690042" +
						"24219022671055626321111109370544217506941658960408" +
						"07198403850962455444362981230987879927244284909188" +
						"84580156166097919133875499200524063689912560717606" +
						"05886116467109405077541002256983155200055935729725" +
						"71636269561882670428252483600823257530420752963450";

// This array will store the digits whose product will be evaluated
var workingarray = [];

// Get user input for number of consecutive digits
function getInput(){
	var readline = require('readline');

	var rl = readline.createInterface({
	  input: process.stdin,
	  output: process.stdout

	});

	rl.question(">>How many adjacent digits should be analyzed?  ", function(answer) {
	   console.log(answer);
		 findLargest(answer);
	   rl.close();
	});
}

// Cycle through array to obtain product
// tested and validated
function getProduct(arraylength){
	var product = 1;
	for (var i=0; i<arraylength; i++){
		product = product * workingarray[i]
	}
	return product;
}

// Create the initial array to be used
// tested and validated
function createArray(arraylength){
	for (var i=0; i<arraylength; i++){
		item = bignum[i];
		workingarray.push(item);
	}
}

// Move forward in array by popping first and pushing onto last in array
// Tested and validated
function pushPop(push){
	// Pop
	workingarray.splice(0, 1);
	// Push
	workingarray.push(push);
}

// Loop function to contain getProduct and getAdjacent
// Function will store a variable for product that will be replaced if new products are greater
function findLargest(arraylength){
	var numstringlen = bignum.length;
	console.log(numstringlen);
	var cyclestring = 1;
	var workingproduct = 0;

	createArray(arraylength);
	var finalproduct = getProduct();

	while (cyclestring < numstringlen){
		pushPop(bignum[cyclestring]);
		workingproduct = getProduct(arraylength);
		if (workingproduct > finalproduct){
			finalproduct = workingproduct;
			console.log(workingarray + " = " + finalproduct);
		}
		cyclestring = cyclestring + 1;
	}
	console.log(finalproduct + " is the largest product of " + arraylength + " adjacent numbers in the given number");
}

// Kick off the program
getInput();
