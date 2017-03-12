# Program is built to complete challenege 1 of the Euler project
# The challenge set fourth is to find all multiples of number within a given numberoccur
# Once that is completed, the challenge asks to find the sum of all multiples

# specifically, the challenge wants to know the sum of all multiples
#  3 and 5 within 1000 (not including)

# Find multiples and add to array multiplesHash array
def findMultiples(withinNumber, findThis, multiplesHash)
	numberoccur = withinNumber/findThis
	if withinNumber%findThis == 0
		numberoccur = numberoccur - 1
	end

	1.upto(numberoccur){|x| multiplesHash.push(x * findThis)}

	sum = multiplesHash.inject {|x, sum| sum + x}

	puts "multiplesHash: " + (multiplesHash.each {|x| puts x}).to_s
	puts "The sum of all multiples provided is now " + sum.to_s
end

# Get the number we are going to find multiples in
def getMainNumber()
	puts "Please enter the number we will find the multiples in."
	withinNumber = gets.chomp
	return withinNumber.to_i
end

# Get the number whose multiples we are going to look for
def getMultiplesNumber()
	puts "Please enter the multiples number you are looking for."
	findThis = gets.chomp
	return findThis.to_i
end

#Greet the User
def programGreeting()
	puts "This program is designed to find all multiples of a number within a given number"
	puts "The program will then also provide the sum of these multiples"
end

# Wait for user to enter the correct input before proceeding
# Function accepts one argument myvar, which can be of any data type
# Function has no returns
def waitforinput(myvar)
	puts "Please enter " + myvar.to_s + " to continue."
	name = gets.chomp
	if name.to_s != myvar.to_s
		puts "That was not the correct input"
		waitforinput(myvar)
	else
		puts "The program will now proceed"
	end
end


def yesnoinput()
	puts "Please enter " + "y" + " or " + "n" + "to continue."
	ans = gets.chomp
	if ans.to_s != "n" && ans.to_s != "y"
		puts "That was not the correct input"
		yesnoinput()
	else
		puts "The program will now proceed"
	end
	return ans
end


def anotherMultiple()
	puts "Would you like to find the multiples of a different number?"
	puts "NOTE: The sum provided will be the sum of BOTH multiples"
	ans = yesnoinput()
	return ans
end

# array which will contain ALL multiples requested during session
multiplesHash = []

# container for functions
def mainContainer(multiplesHash)
	ans = "y"
	programGreeting()
	waitforinput("y")
	withinNumber = getMainNumber()
	while ans == "y"
		findThis = getMultiplesNumber()
		findMultiples(withinNumber, findThis, multiplesHash)
		ans = anotherMultiple()
	end
	puts "Thanks for playing!"
end

# Call to kick off the program
mainContainer(multiplesHash)
