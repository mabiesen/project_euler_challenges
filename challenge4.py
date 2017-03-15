# Euler Challenge number 4
# Find the largest palindrome product of two 3 digit numbers

# This function is used to retrieve all products of two 3 digit numbers
# using embedded while loops
def getProducts():
    firstnum = 999
    secondnum = 999
    mypal = 0
    while firstnum > 0:
        while secondnum > 0:
            product = secondnum * firstnum
            answer = isPalindrome(product)
            if answer == "true":
                if mypal < product:
                    mypal = product
            secondnum = secondnum-1
        firstnum = firstnum-1
        secondnum = 999
    return mypal

# Check to see if the product is a palindrome
# Called from getProducts
def isPalindrome(mynumber):
    myreturn = "false"
    test = str(mynumber)
    if test == ''.join(reversed(test)):
        myreturn = "true"
        print(mynumber)
    return myreturn

# These are the function calls to kick of the program
mypal = getProducts()
print("And the largest palindrome found is ...")
print(mypal)

