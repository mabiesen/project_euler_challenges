
# Project Euler challenge 9
# Find the pythagorean numbers whose values add up to 1000
# The challenge asks you to present the product of the pythagorean numbers
#  Note: pythagorean numbers defined as a squared + b squared = c squared
# According to the theorem, a<b<c

#  Used to round up numbers
import math


# This function does the heavy lifting
# Embedded while loop: inside of c loop look for b, inside of b loop determine a and check
def loopNumbers(minc, start, total):
	possc = start
	while possc >= minc:
		remaining = total - possc
		bmin = math.ceil(remaining/2)
		possb = remaining - 1
		while (possb) > bmin:
			possa = total - possc - possb
			checker = checkPyth(possa,possb,possc)
			if checker == True:
				print("The Pythagorean numbers are:")
				print(possa, possb, possc)
				print("The product of these numbers is")
				print(possa*possb*possc)
			possb = possb - 1
		possc = possc - 1


# Check to see if the numbers a, b, c fit Pythagoras's theorem
def checkPyth(a,b,c):
	if (a*a)+(b*b)==(c*c):
		return True
	else:
		return False


# Used to organize application and set variables
# User is greeted
# Total is declared
# Minimum value of c placed in minc variable
#  Maximum value of c placed in 'start' variable
def mainContainer():
	print("This Euler challenge will find the Pythagorean numbers that add up to 1000")
	total = 1000
	if total%3 == 0:
		minc = (total/3) + 1
	else:
		minc = math.ceil(total/3)
	start = total - 3
	loopNumbers(minc, start, total)

# Kick off the program
mainContainer()
