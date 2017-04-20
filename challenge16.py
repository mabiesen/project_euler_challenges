#Challenge 16, find the sum of all digits in the product of 2 to the 1000th power.
#Super short, works

string = str(2**1000)
mysum = 0
x = 0
while x < len(string):
	mysum = mysum + int(string[x])
	x = x + 1

print(mysum)
