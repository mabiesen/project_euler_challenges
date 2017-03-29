# Euler Challenge 6
# Find the difference between some of squares and square of sums
# for all numbers within a given number

numbersArray = []

# Get the number we are going to generate squares for
def getMainNumber()
	validNum = false
	while validNum == false
		puts "Please enter the number we will be working with."
		givenNumber = gets.chomp
		if (givenNumber.to_i.to_s == givenNumber)
			validNum = true
		else
			puts "That does not appear to be a number.  No spaces please."
		end
	end
	return givenNumber.to_i
end

# generate hash of numbers consisting of 1 through the givenNumber
def genHash(givenNumber, numbersArray)
	1.upto(givenNumber){|x| numbersArray.push(x.to_i)}
end

# Find sum of all squares
def sumOfSquares(numbersArray)
	sum = 0
	numbersArray.each{|x|	sum = sum + (x*x)}
	puts "The sum of each number squared is: " + sum.to_s
	return sum
end

# Find square of all sums
def squareOfSums(numbersArray)
	sum = numbersArray.inject {|x, sum| sum + x}
	square = sum*sum
	puts "The square of all sums is: " + square.to_s
	return square
end


# main container for program
def mainContainer(numbersArray)
	givenNumber = getMainNumber()
	genHash(givenNumber, numbersArray)
	sumsquares = sumOfSquares(numbersArray)
	squaresums = squareOfSums(numbersArray)
	puts "The difference is: " + (squaresums - sumsquares).to_s
end

# Call to kick off the program
mainContainer(numbersArray)
