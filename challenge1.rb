# Program is built to complete challenege 1 of the Euler project
# The challenge set fourth is to find all multiples of number within a given numberoccur
# Once that is completed, the challenge asks to find the sum of all multiples

# specifically, the challenge wants to know the sum of all multiples
#  3 and 5 within 1000 (not including)

# to test the challenge in the context of this application
# 1.  Enter 1000 when prompted for the first number
# 2.  Enter 3 when prompted for the second number
# 3.  You will be provided a sum and an array, and you will be asked if you want to 
#     provide a second number.  choose y
# 4.  Enter 5 when prompted for the new multiple search number

# Per online resources, the output should be:  233168
# Currently, the application yields: 266333


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

	name = "m"
	while name.to_s != myvar.to_s
		puts "Please enter " + myvar.to_s + " to continue."
		name = gets.chomp
		if name.to_s != myvar.to_s
			puts "That was not the correct input"
		end
	end

	puts "The program will now proceed"
end




#  Prompt user for a yes or no answer
def yesnoinput()

	ans = "m"
	while ans.to_s != "n" && ans.to_s != "y"
		puts "Please enter " + "y" + " or " + "n" + "to continue."
		ans = gets.chomp
		if ans.to_s != "n" && ans.to_s != "y"
				puts "That was not the correct input.  Please try again."
		end
	end

	puts "The program will now proceed"
	return ans
end



#  This is an option to search for a secondary multiple
#   This option is necessary per challenge requirements
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
