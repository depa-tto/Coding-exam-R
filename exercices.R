# Ex 1 --------------------------------------------------------------------

# Define a function f which, given a numeric vector as input, returns a
# list containing the mean, variance, minimum, and maximum of that vector.
# Assign appropriate names to the elements of the list and test it with suitable
# input.

f <- function(x){
    x <- as.numeric(x)
    y = list(mean(x), var(x), min(x), max(x))
    return(y)
}

x = c(3,5,6,7,5,3,5,3,5,6)
f(x)

# Ex 2 --------------------------------------------------------------------

# The Collatz conjecture states that, given any natural number n, applying
# the following algorithm:
# a) if n is even, divide it by 2;
# b) if n is odd, multiply it by 3 and add 1;
# then the sequence of elements always ends by reaching the number 1.

# Implement a function that, given a natural number n of length 1 as input,
# returns the next number according to the defined Collatz conjecture algorithm.
# For example, my_collatz(4) should return 2, my_collatz(5) should return 16,
# and so on.

my_collatz <- function(x){
    if (x %% 2 == 0){
        return(x / 2)
    } else{
        return((x * 3) + 1)
    }
}

my_collatz(4)
my_collatz(5)

# Ex 3 --------------------------------------------------------------------

# Implement a for loop that prints the lyrics of the famous song "99
# bottles of beer on the wall": http://www.99-bottles-of-beer.net/
for (i in 99:1) {
  if (i > 1) {
    print(paste(i, "bottles of beer on the wall,", i, "bottles of beer."))
    print("Take one down and pass it around,")
    print(paste(i-1, "bottles of beer on the wall."))
  } else {
    print("1 bottle of beer on the wall, 1 bottle of beer.")
    print("Take it down and pass it around,")
    print("No more bottles of beer on the wall.")
  }
}


# Ex 4 --------------------------------------------------------------------

# Implement the famous "fizzbuzz" algorithm. This algorithm loops
# through an input numeric vector (i.e., x = 1:100) applying the following
# conditions:

# - if the input at position i of x is divisible by 3, print the string "fizz";
# - if the input at position i of x is divisible by 5, print the string "buzz";
# - if the input at position i of x is divisible by 3 and 5, print the string "fizzbuzz";
# - otherwise, print the value of x[i]

x = 1:100

for (i in x){
    if (i %% 3 == 0 && i %% 5 == 0){ # MIND THE ORDER OTHERWISE THE 'fizzbuzz' CONDITION IS NEVER MET
        print('fizzbuzz')
    } else if (i %% 3 == 0){
        print('fizz')
    } else if (i %% 5 == 0){
        print('buzz')
    } else{
        print(i)
    }
}

# Ex 5 --------------------------------------------------------------------

# Develop a function (e.g., my_collatz_sequence) that, given a
# natural number n as input, returns as output a vector containing the complete
# sequence of values returned by the Collatz algorithm until reaching 1. For
# example, my_collatz_sequence(5) should return the vector composed of elements
# c(5, 16, 8, 4, 2, 1).

my_collatz_sequence <- function(n) {
  output <- c(n) 
  while (n != 1) {
    if (n %% 2 == 0) {
      n <- n / 2 
    } else {
      n <- (n * 3) + 1  
    }
    output <- append(output, n)  # append the new value of n to the output vector
  }
  return(output)  
}

my_collatz_sequence(5)

