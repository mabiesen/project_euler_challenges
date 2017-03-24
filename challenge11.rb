# Project Euler Challenge 11
# Find the greatest product of any four adjacent numbers in the grid

# Grid numbers provided by project Euler
# Grid is an array of arrays for better accessibility and portability
# Note: project euler provided numbers with preceding zeroes due to octal error
grid = [
[8, 2, 22, 97, 38, 15, 0, 40, 0, 75, 4, 5, 7, 78, 52, 12, 50, 77, 91, 8],
[49, 49, 99, 40, 17, 81, 18, 57, 60, 87, 17, 40, 98, 43, 69, 48, 4, 56, 62, 0],
[81, 49, 31, 73, 55, 79, 14, 29, 93, 71, 40, 67, 53, 88, 30, 3, 49, 13, 36, 65],
[52, 70, 95, 23, 4, 60, 11, 42, 69, 24, 68, 56, 1, 32, 56, 71, 37, 2, 36, 91],
[22, 31, 16, 71, 51, 67, 63, 89, 41, 92, 36, 54, 22, 40, 40, 28, 66, 33, 13, 80],
[24, 47, 32, 60, 99, 3, 45, 2, 44, 75, 33, 53, 78, 36, 84, 20, 35, 17, 12, 50],
[32, 98, 81, 28, 64, 23, 67, 10, 26, 38, 40, 67, 59, 54, 70, 66, 18, 38, 64, 70],
[67, 26, 20, 68, 2, 62, 12, 20, 95, 63, 94, 39, 63, 8, 40, 91, 66, 49, 94, 21],
[24, 55, 58, 5, 66, 73, 99, 26, 97, 17, 78, 78, 96, 83, 14, 88, 34, 89, 63, 72],
[21, 36, 23, 9, 75, 0, 76, 44, 20, 45, 35, 14, 0, 61, 33, 97, 34, 31, 33, 95],
[78, 17, 53, 28, 22, 75, 31, 67, 15, 94, 3, 80, 4, 62, 16, 14, 9, 53, 56, 92],
[16, 39, 5, 42, 96, 35, 31, 47, 55, 58, 88, 24, 0, 17, 54, 24, 36, 29, 85, 57],
[86, 56, 0, 48, 35, 71, 89, 7, 5, 44, 44, 37, 44, 60, 21, 58, 51, 54, 17, 58],
[19, 80, 81, 68, 5, 94, 47, 69, 28, 73, 92, 13, 86, 52, 17, 77, 4, 89, 55, 40],
[4, 52, 8, 83, 97, 35, 99, 16, 7, 97, 57, 32, 16, 26, 26, 79, 33, 27, 98, 66],
[88, 36, 68, 87, 57, 62, 20, 72, 3, 46, 33, 67, 46, 55, 12, 32, 63, 93, 53, 69],
[4, 42, 16, 73, 38, 25, 39, 11, 24, 94, 72, 18, 8, 46, 29, 32, 40, 62, 76, 36],
[20, 69, 36, 41, 72, 30, 23, 88, 34, 62, 99, 69, 82, 67, 59, 85, 74, 4, 36, 16],
[20, 73, 35, 29, 78, 31, 90, 1, 74, 31, 49, 71, 48, 86, 81, 16, 23, 57, 5, 54],
[1, 70, 54, 71, 83, 51, 54, 69, 16, 92, 33, 48, 61, 43, 52, 1, 89, 19, 67, 48]
]

# This array is used to store the four values whose products we are evaluating
workingarray = []

# This function is used to define the size of our initial array
# Range is based on arraylen, which was provided by the user
def initialArray(workingarray,range)
	range.each do |x|
		workingarray.push(x)
	end

end


def rightSide(posx,posy,grid, workingarray, range)
	if posx > (20-workingarray.length)
		return 0
	end

	product = 1
	range.each do |x|
		workingarray[x] = grid[posy][posx + x]
		product = product * workingarray[x]
	end
	return product
end

def downSide(posx,posy,grid, workingarray, range)
	if posy > (20-workingarray.length)
		return 0
	end

	product = 1
	range.each do |x|
		workingarray[x] = grid[posy + x][posx]
		product = product * workingarray[x]
	end
	return product
end

def leftDiag(posx,posy,grid, workingarray, range)
	if posx < (workingarray.length - 1) || posy > (20-workingarray.length)
		return 0
	end

	product = 1
	range.each do |x|
		workingarray[x] = grid[posy + x][posx - x]
		product = product * workingarray[x]
	end
	return product
end

def rightDiag(posx,posy,grid, workingarray, range)
	if posx > (20-workingarray.length) || posy > (20-workingarray.length)
		return 0
	end

	product = 1
	range.each do |x|
		workingarray[x] = grid[posy + x][posx + x]
		product = product * workingarray[x]
	end

	return product
end


# Loop to go through each item in grid and perform above functions
# Bulky in its current state, should use classes to help iterate over methods?
def loopGrid(input,grid,workingarray)
	arraylen = input
	range = 0..(arraylen-1)
	initialArray(workingarray,range)
	posy = 0
	posx = 0
	product = 0
	grid.each do |row|
		row.each do |element|
			temp = rightSide(posx,posy,grid, workingarray, range)
			if temp > product
				product = temp
			end
			temp = downSide(posx,posy,grid, workingarray, range)
			if temp > product
				product = temp
			end
			temp = rightDiag(posx,posy,grid, workingarray, range)
			if temp > product
				product = temp
			end
			temp = leftDiag(posx,posy,grid, workingarray, range)
			if temp > product
				product = temp
			end
			posx += 1
		end
		posx = 0
		posy += 1
	end
	puts("The greatest product of any #{input} adjacent digits is: #{product}")
end

# Kick off the program
# Asked user for input here.
puts("This program will look for the greatest product of any 'x' adjacent numbers in the grid.")
puts("The program looks in all directions: up, down, left, right, diagonal right, diagonal left.")
puts("Please provide a number under 20")
input = gets().chomp
input = input.to_i
loopGrid(input,grid,workingarray)
