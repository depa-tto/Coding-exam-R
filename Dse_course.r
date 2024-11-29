# ====================================
#              Lecture 1
# ====================================


getwd() # retrives the current working directory

# setwd(): changes the working directory

ls() # lists the objects present in the workspace

rm() # deletes one or more specified objects from the workspace

rm(list = ls()) # removes all objects from the workspace

library() # lists the installed packages in the library specified by .libPaths()

# ====================================
#           Lecture 2
# ====================================

# numeric: Represents numbers and is divided into:
# double: Double-precision floating-point numbers.
# integer: Integer numbers.

x <- 14.33 # decimal values are called 'numeric' in R
class(x) # class of x
typeof(x) # type of R object of x

x <- 10
class(x) # so even if an integer is assigned to a variable, it is still numeric
is.integer(x)
typeof(x)

x <- as.integer(11)
is.integer(x)
class(x) # now the x is converted into an integer
typeof(x)

# integers can also be declared by appendig an L suffix

y <- 22L
class(y)

# Complex numbers

z <- 5 + 2i
typeof(z)

Re(z) # real part
Im(z) # imaginary part
Mod(z) # modulus

# logical type

x <- 2 > 1
x

# Standard logical operations are & (and), | (or), and ! (not):

u <- TRUE
v <- FALSE
u & v

address <- 'Via'
domain <- 'Conservatorio'
paste(address, domain, sep = ' ') # two character values can be concatenated with the paste function

my_str = 'Via Conservatorio'
sub('Via', 'Piazza', my_str) # with sub we can substitute terms in a string

# vectors
# created with the c() function, that stands for CONCATENATE

c(1,2,3,4,5,6)

c("Italy","Spain","France","UK","Ireland","Belgium")

# vectors can contain only equal data types

c(FALSE, 1, '2') # in this case, FALSE and 1 will be converted to characters

x <- c(FALSE, 1, '2')
class(x[1])
class(x[2])
class(x[3])

# vectors with attached labels

c('Tottenham' = 14, 'Aston Villa' = 12, 'Brentford' = 6)

x <- c(14,12,6,4) # vector
n <- c('Tottenham', 'Aston Villa', 'Brentford') # vector of names
names(x) <- n # assigning names
x 
# note that where there is no match between value and column the column will have <NA>
# while if there is a column name more than the number of values, an error will be given

# matrix

M <- matrix(data = c(1,2,3,4,5,6), # data elements
        ncol = 3, # number of columns
        nrow = 2, # number of rows
        byrow = TRUE) # fill matrix by rows

G <- matrix(c(1,2,3,4,5,6,7,8,9),nrow=3) # by columns is the default behaviour
rownames(G) <- c('a','b','c')
colnames(G) <- c('d','e','f')
G

M

rn <- c('row1', 'row2')
cn <- c('col1', 'col2', 'col3')

rownames(M) <- rn
colnames(M) <- cn

M

N <- matrix(c(9,8,7,6,5,4,3,2,1),nrow=3,ncol=3)

rownames(N) <- c('r1','r2','r3')
colnames(N) <- c('c1','c2','c3')

N

# list

# a list is a collection of objects. is the most general and flexible element in R
# because the can contain elements of any type, including other lists

new_list <- list(
        A = matrix(c(1,2,3,4), ncol = 2),
        y = c(5,6,7,8)
)

new_list

new_list[2]
new_list$y
new_list[[2]] 

new_list$A[2] # how to take a value in a nested list
new_list$y[3]
 

# declaring a nested list
nested_list <- list(list(letters[1:8],"secondele"),5:15)

nested_list

print ("Accessing first sub-list of the list")
nested_list[1]

print ("Accessing first component of the list")
nested_list[[1]]

print ("Accessing components inside component of the list")
nested_list[[1]][[2]]


nested_list <- list(
  a = list(x = 1, y = 2),
  b = list(z = 3, w = 4)
)


nested_list[[1]]          # access to first list (a)
nested_list[[1]][["x"]]   # access to element 'x' of list 'a'
nested_list[[2]][["z"]]   # access to element 'z' of list 'b'


nested_list$a             # access to first list (a)
nested_list$a$x           # access to element 'x' of list 'a'
nested_list$b$z           # access to element 'z' of list 'b'


# factors

# they are used to represent categorical data and can be either ordinal,
# for example company hierarchies, or non ordinal

# a factor MUST be imagined as a vector of integers,
# where each integer is associated with a label


x <- factor(c("yes", "yes", "no"))
x # by default, the levels are ordered alphabetically

# additionally, if the levels have a hierarchy (e.g., soldier, lieutenant, marshal, etc.),
# we can indicate this by specifying ordered = TRUE in the factor function.

str(x) # structure of the factor.
# here we can see that a factor in nothing more than an integer associated with a label

table(x) # we get back a table with the levels and frequencies of the variables


# data frames

# they are a class of objects to represent data matrices
# rows are statistical units
# columns are variables

head(iris, n = 10)


str(iris)

# new data frames are usually created with the data.frame() function.
# be aware: data.frame()’s default behaviour turns strings into factors

# to avoid the problem of converting strings into factors,
# we can use 'stringAsFactors' = FALSE

v1 <- c(10,20,30)                                # numeric vector
v2 <- c('a','b','c')                             # character vector
v3 <- c(TRUE,TRUE,FALSE)                         # logical vector
data.frame(v1, v2, v3, stringsAsFactors = FALSE) # data.frame

s = c("a"=5, "b"=4, "c"=3, "d"=2, "e"=1)
s
s[3] # subsetting vectors

s[-3] # dropping elements! this will not count in reverse order!

s[10] # IMPORTANT: out of range index returns NA

indx <- c(2,3,4) # we can retrive more than one element
s[indx]

s[-indx]

i_names <- c('d', 'b') # we can also retrive elements with their names
s[i_names]


i_logical <- c(FALSE, FALSE, TRUE, FALSE, FALSE) # we can use also logical vectors
s[i_logical]

# the logical vector will be recycled if it is shorter than the vector to subset

i <- c(FALSE, TRUE)
s[i]

i <- s > 2 # conditional subsetting
s[i]


# values in a matrix are retrieved by using the [,] operator, 
# placing the row and column dimension before and after the comma

M <- matrix(1:12, nrow = 3, ncol = 4, byrow = TRUE)
rownames(M) <- c('r1', 'r2', 'r3')
colnames(M) <- c('c1', 'c2', 'c3', 'c4')
M 

M[2,3] # before the row and after the comma

M[1,] # retrive the entire first row

M[,1] # retrive the entire first column

i <- c(2, 3)
M[i, ]

M[c(1, 3), c(2, 4)]

# we can use also names of columns and rows

i <- c('r1', 'r3')
M[i,]

i <- c('c2', 'c4')
M[, i]

i <- c('c2', 'c4')
M[3, i]


i <- c(TRUE, FALSE, FALSE)
M[i, ]

i <- c(TRUE, FALSE)  # ->  c(TRUE, FALSE, TRUE)
M[i, ]

i <- M[, 'c3'] < 2 * M[, 'c1'] # take the index of where the condition is TRUE
M[i, 'c4']

M

# subsetting lists
# https://r4ds.had.co.nz/vectors.html#visualising-lists

# The distinction between [ and [[ is really important for lists, 
# because [[ drills down into the list while [ returns a new, smaller list
# [[ extracts a single component from a list. It removes a level of hierarchy from the list.

new_list

new_list[2] # we take the second element of the list that is a list
new_list[[2]] # the result is the content of the second element, not wrapped in a list

class(new_list[2]) # output: 'list'
class(new_list[[2]]) # output: 'numeric'

str(new_list[2]) # A LIST containing only the second element
str(new_list[[2]]) # the second element of the list

# we can extract elements using $

new_list$A
# or
new_list[['A']]

# the same works for data frames

head(iris$Sepal.Length) # output: vector

head(iris[['Sepal.Length']]) # output: vector

head(iris[[1]]) # output: vector

head(iris[1]) # output a dataframe with 1 column

# in addition R allows to use a typical matrix syntax

iris[1,] # first row

head(iris[,1]) # first column


iris[1,3] # is the observation corresponding to the first row and the third column

head(iris[, 1,drop=FALSE],n = 3) # the first column (as a one-dimensional data frame)
head(iris[, 1,drop=TRUE],n = 3) # the first column 

# ====================================
#           Lecture 3
# ====================================

# If two vectors are of unequal length, 
# the shorter one will be recycled in order to match the longer vector 

x <- c(100, 200, 300, 400, 500)
y <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)

# so in this case the 2 vectors have different lenghts,
# and their sum is computed by recycling values of the shorter vector

x + y 

a <- 1
x + a

b <- 2
x * b

M <- matrix(1:16, ncol = 4, nrow = 4, byrow = TRUE)
M
M + a
M * b

M
x
M + x # sum the vector x by column 
M
x
M * x # product between the vector x by the columns of the matrix

N <- M <- matrix(1:20*10, ncol = 5, nrow = 4, byrow = TRUE) # by 50

M
N
M + N

M
x
M %*% x # matrix product

M
x
M * x # product between the elements in the vector and the columns of the matrix


x <- c(100, 200, 300, 400, 500)
y <- c(1, 2, 3, 4, 5)
x %*% y # vector multiplication: 100*1+200*2+300*3+400*4+500*5

# if statement
if (7==7){
        print('seven in equal to seven')
}

x <- 6
y <- 6
z = x + y

if (z == 13){
        print('true')
} else {
        print('false')
}

# if-else-else

if (x>y) {
        print('x is grater')
} else if (x<y) {
        print('y is grater')
} else {
        print('x and y are equal')
}

# nested if

x <- 7
y <- 5
z <- 2
if(x > y) {
  print("x is greater than y")
  if(x > z) {
    print("x is greater than y and z")
  }
}

# in R conditional statement as if are not vectorized,
# and they handle only single values.
# so if a vector is passed into an if, it checks only
# the first element and gives an error for multiple conditions

v <- c(1,2,3,4,5,6,7,8,9)

if (v %% 2 == 0){
        print('even')
} else {
        print('odd')
}

# so in the function above we will have an error.
# while using ifelse(), the function will checks a condition
# for every element in the vector

ifelse(v %% 2 == 0, 'even', 'odd') 

# we can use ifelse to choose between 2 vectors


v1 <- c(1,2,3,4,5,6)
v2 <- c("a","b","c","d","e","f")
ifelse(c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE), v1, v2)
# for positions where the condition is TRUE, it takes values from v1: "1", "3", "5".
# for positions where the condition is FALSE, it takes values from v2: "b", "d", "f".


# and(&&), or(||), not(!)

x <- 7
y <- 5
z <- 2
if(x > y && x > z){
        print('x is the greatest number')
}

x <- 7
y <- 5
z <- 9
if(x > y || x > z) {
  print("x is greater than y or z")
}

# compute the absolute value of x and assign it to y

x <- -7
if (x<0){
        y <- (-x) 
} else {
        y <- x
}

y

# we can use abs() as well

abs(x)

# which function

# which function returns the array indeces that meet a specific condition

v1 <- c(10, 20, 30) # numeric vector
v2 <- c('a', 'b', 'c') # character vector
v3 <- c(TRUE, TRUE, FALSE) # logical vector

my_data <- data.frame('c1' = v1, 
                      'c2' = v2, 
                      'c3' = v3, 
                      stringsAsFactors = FALSE)
my_data

# we want all the row numbers where column c1 is greater
# than or eual to 20

which(my_data$c1 >= 20)

M
which(M == max(M))
which(M == max(M), arr.ind = TRUE) 

# %in%
 
# this operator can be used to identify if an element,
# like a number belongs to a vector or dataframe

a <- LETTERS[1:10]
a

b <- LETTERS[7:12]
b

b %in% a

# the split function takes a vector and splits it 
# into groups defined by a factor

# generates 5 values from a standard normal, 5 values from
# uniform distribution (0,1), 5 values from a normal with mean 1 and sd 2:

x <- c(rnorm(n = 5), runif(n = 5), rnorm(n = 5, mean = 1,sd = 2))
f <- gl(3, 5) # generate levels (as.factor(rep(1:3, each=10)))
x
my_data <- split(x, f)
my_data


# for loops are used for iterating over the elements of an object and 
# doing some operations in the body of the loop
for(i in 1:5){
  print(i)
}


# seq() can be used to generate a sequence
# with seq() we can also iterate with some different step lengths

v <- seq(from=1, to=10, by=2)
v

for (i in v){
        print(i)
}

# range() can be used within seq()

my_range <- range(1,10)
l <- seq(my_range[1], my_range[2], by=2)
l
for (i in l){
        print(i)
}

marks <- c(23,29,30,30,21,25,27,30,39,19)
len_marks <- length(marks)
sum <- 0

for (i in (1:len_marks)){
        sum <- sum + marks[i]
}
print(paste("The sum is: ", sum))

print(paste("The mean is: " , sum/len_marks))

# while 

# while execute the loop untile the condition in the body
# is true. if the condition becomes false, it stops

val <- 1
while(val < 5){
        val <- val + 1
        print(val)
}

val <- 6
iter_max <- 0
while(val > 5) {
  val <- val + 1
  print(val)
  iter_max <- iter_max + 1
  if(iter_max >= 10){
    break
  }
}

# next

# next statement skip the current iteration of a loop
# without terminating it

x <- 1:6
for (i in x){
        if (i == 2){
                next # tt jumps the evaluation of the condition holding the current loop
        }
        print(i)
}

# functionals: function that takes a function as an input
# and returns a vector as output

# lapply() function applies a function to each element of a list
# returning a list!

x <- list(a = 1:10, b = 1:100, c = c(1,2,3,5,6,7,8))
x
lapply(X = x, FUN = mean)

# runif() generates random deviates from U(min,max) with
# default min=0,max=1
lapply(X = 1:4, FUN = runif) # here, lapply interprets each element of X as the n argument for runif

# when you pass a function to lapply(), it takes elements of the 
# list and passes them as the first argument of the function you are applying
# The first argument of runif() is n, and so the elements of the sequence 1:4 
# all got passed to the n argument

set.seed(33) # with for loops
res <- vector(mode = "list",length = 4)
for (i in 1:4) {
  res[[i]] <- runif(n = i,min = 0,max = 1)
}
res

set.seed(33) # with lapply using the dot-dot-dot argument
(res <- lapply(X = 1:4, FUN = runif, min=0,max=10))


set.seed(33) # with lapply explicitly defining FUN
(res <- lapply(X = 1:4, FUN = function(num) runif(n = num, min = 0, max = 10)))

# sapply()

# the sapply() function is similar to lapply(),
# but sapply will try to simplify the result of apply

# sapply() calls lapply() on its input and then applies the following algorithm:
# if the result is a list where every element is length 1, then a vector is returned;
# if the result is a list where every element is a vector of the same length (> 1), a matrix is returned;
# if it can’t figure things out, a list is returned.

# example returning a vector

x <- list(a = 1:10, b = 1:100)
sapply(x, FUN = mean)
lapply(x, FUN = mean)

# example returning a matrix

BOD

sapply(BOD, function(x) 10 * x)

# ====================================
#           Lecture 4
# ====================================

# the apply() function is used to evaluate a function over the 
# margins(rows or columns) of an array

M <- matrix(1:20, nrow = 4, ncol = 5, byrow = TRUE)
M

print(apply(M, MARGIN = 2, FUN = mean)) # we want the mean of each column

print(apply(M, MARGIN = 1, FUN = mean)) # we want the mean of each row

# tapply() function is used to evaluate a function to each group of values 
# defined by a factor!
# the basic syntax for tapply() is as follows: tapply(data, INDEX, FUN)
# data: the vector or array you want to summarize
# INDEX: a list of factors or grouping variables used to split the data
# FUN: the function you want to apply to each subset

x <- c(rnorm(10), runif(10), rnorm(10, 1))
# rnorm(10) generates 10 random values from a standard normal distribution (mean 0, SD 1).
# runif(10) generates 10 random values from a uniform distribution between 0 and 1.
# rnorm(10, 1) generates 10 random values from a normal distribution with mean 1 and SD 1.
x

# gl(3, 10) generates a factor variable with 3 levels (1, 2, 3), each repeated 10 times, resulting in 30 values
f <- gl(3, 10) # [1] 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3
f
tapply(X = x, INDEX = f, FUN = mean) 

# tapply() is also useful in dataset that contain a factor


# This applies the function mean to the values of x, grouped by the levels of f.
# The result is the mean of each group in x corresponding to the levels of f

# also useful in dataframes that contain a factor
tapply(X = iris$Sepal.Length, INDEX = iris$Species, FUN = mean)

# functions

function_name <- function(arg1, arg2, arg3 = NULL, ...) {
  # code 
  return(...)  
}

# arg1, arg2 and arg3 are the input values
# arg3 = NULL is the default value. if arg3 is not provided NULL will be used

# function to compute the sum of the first n integer numbers

sum_fun <- function(n){
        s <- sum(1:n)
        return(s)
}

sum_fun(n = 100)

# function to compute the p-norm of a vector x
p_norm <- function(x, p = 2){
        d <- sum(x^p)^(1/p)
        return(d)
}
print(p_norm(x = c(1, 1))) # default value of p = 2

print(p_norm(x = c(1, 1), p = 3)) # compute the 3-norm of the vector c(1,1)


# functions

# a function firstly creates a temporary local enviroment
# this local enviroment is destroyed as soon as the functions ends

test <- function(){
        tets_string <- 'This object is destroyed as soon as the function ends'
        cat(tets_string)
}

test()

# R firstly search in the local environment
# if the object is not present in searches in the global enviroment for that object

i <- 5 # global value

test <- function(){
        # since there is no i in the local env. the function will search in the global env
        i <- i * 10 # local variable i
        return(i)
}

test()
i # global env. has not changed

# call an external function

source("my_regr_coeff.R") # with source we load this function in the enviroment

height = c(160, 172, 175, 168, 170, 171, 169, 165, 165, 160, 180, 186, 190, 170)
weights = c(55, 67, 80, 68, 72, 75, 70, 65, 62, 60, 85, 90, 92, 71)

fit <- my_rc(X = height, Y = weights)
fit

# CVS: Comma Separated Values

# a comma-separated values (CSV) file is a delimited text file that uses a comma to separate values
# a csv file stores tabular data in plain text
# each line of the file is a data record
# each record consists of one or more fields, separated by the delimiter

data('mtcars')
write.csv(mtcars, file = 'my_mtcars.csv') # we are exporting the file, putting it in the repository


# the easiest way to read a csv file is through read.csv()

x <- read.csv('my_mtcars.csv')
head(x, n=5)

covid_daily_report = read.csv(file = "https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/jhu/full_data.csv")
head(covid_daily_report, n = 5)


# the quantmod package provides a very usefull function for 
# downloading finacial data from the web
# for currencies, the oanda source is used

library(quantmod)
x <- getSymbols(Symbols = 'EUR/USD', src = 'oanda', auto.assign = FALSE)
head(x)
tail(x)

# for economic series, the FRED source is used 

# retrieve the historical Gross Domestic Product for Japan
x <- getSymbols(Symbols = 'JPNNGDP', src = 'FRED', auto.assign = FALSE)   
tail(x)

# ====================================
#           Lecture 5
# ====================================

x1 <- 1:10
y1 <- 10:1
plot(x1, y1)

# we can easily modify our plot
# cex=number to change the size of the points (1 is default, while 0.5 means 50% smaller, and 2 means 100% larger)
# point shape: use 'pch' with a value from 0 to 25 to change the point shape format:
plot(x1, y1, col = "red", cex = 2, pch = 20, xlab = "Hi!", ylab = "", main = "My second plot!")

# we can add new point to an existing plot using the points() function
x2 <- runif(100, min = 0, max = 10)
y2 <- runif(100, min = 0, max = 10)
plot(x1, y1, col = "red", cex = 2, pch = 20)
points(x2, y2, col = "blue", cex = 2, pch = 20)

# to present two sets of points in separate plots within the same panel we can 
# use the mfrow parameter

par(mfrow = c(1,2)) # one row two columns
plot(x1, y1, type = 'b', col = 'red', cex = 2, pch = 20) # 'b' means both points and lines connecting the points will be plotted.
plot(x2, y2, col = 'blue', cex = 2, pch = 20)

# to reset the old graphical parameters and close the graphical device we use:
dev.off()
par(mfrow = c(1,1)) #  1 row and 2 columns filled by row

# we can use segments() and lines() functions to add lines and segments to an existing plot:
# - lwd modifies line width
# - col modifies line color
# - lty modifies line type

# x0 and y0: Starting coordinates of each segment.
# x1 and y1: Ending coordinates of each segment.

plot(x2, y2, xlim = c(-0.25, 10.25), ylim = c(-0.25, 10.25), pch = 20)
segments(
  x0 = c(0,   0, 10, 10), y0 = c(0,  10, 10,  0),
  x1 = c(0,  10, 10,  0), y1 = c(10, 10,  0,  0),
  lwd = 2, col = 2,  lty = 2
)


plot(x2, y2, xlim = c(-0.25, 10.25), ylim = c(-0.25, 10.25), pch = 20)
segments(
  x0 = c(0,   0, 10, 10), y0 = c(0,  10, 10,  0, 0,  10),
  x1 = c(0,  10, 10,  0), y1 = c(10, 10,  0,  0, 10,  0),
  lwd = 2, col = 2,  lty = 2
)


plot(x2, y2, xlim = c(-0.25, 10.25), ylim = c(-0.25, 10.25), pch = 20)
segments(
  x0 = c(0,   0, 10, 10, 0,   0), y0 = c(0,  10, 10,  0, 0,  10),
  x1 = c(0,  10, 10,  0, 10, 10), y1 = c(10, 10,  0,  0, 10,  0),
  lwd = 2, col = 2,  lty = 2
)


# the plot() function is vectorized with respect to its parameters
# we can pass vectors to certain arguments like
# - color(col)
# - point type(pch)
# - sixe(cex)

plot(x1, y1, col = 1:10, pch = 1:10, cex = 1:10, lwd = 3, 
        xlab = "", ylab = "", xlim = c(0, 11), ylim = c(0, 11))

# the function 'lines()' can be used to add lines to an existing plot overlaying it

x3 <- seq(-5, 5, by = 0.1)
plot(x3, sin(x3), type = 'l', ylab = '', xlab = 'x', lwd = 2, col = 'red')

lines(x3, cos(x3), lwd = 2, col = 'blue')

# histograms

set.seed(1)
x4 <- rnorm(n = 500)
hist(x4)

hist(x4, breaks = 30, freq=FALSE) # with breaks we can control the number of breakpoints

# The hist() function can plot relative frequencies
# the density() function can be used to estimate the probability density of the data

hist(x4, breaks=30, freq=FALSE)
lines(density((x4)))

# the density() function provides a non parametric estiamte of the probability density function

# Plotting density estimates with different bandwidths (bandwidth is the difference between the upper and lower frequencies)
plot(density(x4, bw = 1)) # bw is the parameter responsable of smoothing

plot(density(x4, bw = 0.1)) # less smooyhing

# the curve() function is used to plot mathematical expression in R

curve(expr = x^3 - x^2 - 3*x, from = -2, to = 2.5) # plotting a cubic function 

# the curve() function can also be used to plot predefined functions like dnorm(),
# which represents the probability density function of a normal distribution

curve(dnorm, from = -3, to = 3) # plot the standard normal distribution

# custumization

curve(expr = x ^ 3 - x ^ 2 - 3 * x,
  from = -2, to = 2.5, lwd = 2, col = 2,
  main = bquote(f(x) == x^3 - x^2 - 3 * x), #  see plotmath
  xlab = "", ylab = "", cex.axis = 1.25, cex.main = 2, lty = 2
)


# empirical comulative distribution function(ECDF)

# the ecds() function calculates the ecdf for a numeric vector
# ECDF represents the percentage of values in x that are less than or equal to t

x5 <- c(1,2,3)
plot(ecdf(x5))

# generating random normal data and comparing ECDF with CDF
set.seed(1)
x <- rnorm(100)
plot(ecdf(x), cex = 0.1) # ECDF plot
curve(pnorm, add = TRUE, col = 2, lwd = 2) # overlay theoretical CDF
pnorm

# ====================================
#           Lecture 6
# ====================================

# tibble: tabular format. 
# differences between tibbles and data frames:

# 1.printing: For tibbles, only the first 10 rows and the first 6 columns of the dataset are printed. 
# the class of each variable is also displayed.
# 2.subsetting: Tibbles do not perform partial matching. 
# additionally, subsetting a tibble always returns a tibble.
# 3. in tibbles, character variables are not converted to factors. 
# also, tibbles do not have row names.

library(tibble)
head(iris, 3)
iris_tbl <- tibble::as_tibble(iris)
iris_tbl

iris$Species
head(iris$Species, 3)
head(iris_tbl$Species, 3)

head(iris[,1])
iris_tbl[,1]

# if we use the library readr to import external data, the result will always be a tibble

library(ggplot2)
data(mpg)
head(mpg)

# relationhip existing between hwy, so miles per gallon and displ, so engine displacement
ggplot(data = mpg) + 
        geom_point(mapping = aes(x = displ, y = hwy))

# ggplot creates an empty plot
# with geom_point we add an extra layer to the plot creating a scatterplot
# to define how a layer is crated we use 'aes' function, within which we
# specify which values to map to x-axis and the y-axis

# structures
# ggplot(data = DATA) + 
#        GEOM_FUNCTION(mapping = aes(MAPPINGS))

# GEOM_FUNCTION is a function that creates a layer
# MAPPINGS are the parameters we pass to the function

# how does the relationship between hwl and displ chenage with respect to the vehicle type
ggplot(data = mpg) + 
        geom_point(mapping = aes(x = displ, y = hwy, color = class))

# we can associate the class variable with different characteristics of a poit such as its size
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = drv))


ggplot(data = mpg) + 
        geom_point(mapping = aes(x = displ, y = hwy), col = "blue")

ggplot(data = mpg) + 
        geom_smooth(mapping = aes(x = displ, y = hwy))

# we now are going to modify the line type

# the next plot will give us a trend line for different values of drv
ggplot(data = mpg) + 
        geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

# multiple layers
ggplot(data = mpg) +
        geom_smooth(mapping = aes(x = displ, y = hwy)) +
        geom_point(mapping = aes(x = displ, y = hwy))

# we can see that the code is quite repetitive
# we can avoid that by specifying the common aesthetics inside the ggplot funciton
# and the unique ones inside the GEOM_FUNCTION

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
        geom_point(mapping = aes(col = class)) +
        geom_smooth()


ggplot(data = mpg, mapping = aes(x = displ, y = hwy, col = class)) +
  geom_point(size = 3, alpha = 0.7) +  # Larger points with transparency
  geom_smooth(se = FALSE, linetype = "dashed", linewidth = 1.2,span=1.5) +  # Smoother lines without confidence interval
  scale_color_brewer(palette = "Set1") +  # Use a colorblind-friendly palette
  labs(
    title = "Fuel Efficiency vs Engine Displacement",
    subtitle = "Relationship between engine size and highway fuel efficiency across car types",
    x = "Engine Displacement (liters)",
    y = "Highway Fuel Efficiency (mpg)",
    color = "Vehicle Class"
  ) + 
  theme_minimal(base_size = 15) +  # Clean minimalistic theme
  theme(
    plot.title = element_text(face = "bold", size = 18, hjust = 0.5),
    plot.subtitle = element_text(size = 14, hjust = 0.5),
    legend.position = "bottom",  # Move legend to the bottom
    legend.title = element_text(size = 12),
    legend.text = element_text(size = 10),
    legend.background = element_rect(fill = "gray95", color = NA)
  )

# ====================================
#           Lecture 7
# ====================================

# set.seed function: allows to set the state for random number generation in R

# Ideally, in the classic definition, a random number should come from a 
# Continuous Uniform distribution with parameters 0,1
# So, the definition is:
# A sequence of random numbers is formed by real numbers in the interval (0,1) 
# generated in sequence, independently and with the same probability.

# Pseudo-random number (PRN) generators:

# The term ‘pseudo’ indicates that the generated values are not truly random (they should be called fake random numbers).
# PRNs are the result of an ordered and finite series of deterministic operations.
# These algorithms are often recursive, sometimes causing autocorrelation in the series of values produced, contrary to the desired independence.


# Characteristics of good pseudo RN generators:
# They should produce numbers that appear to be uniformly distributed in the interval (0, 1), with minimal dependence structure.
# They must be fast enough for simulation purposes.
# They should have efficient computational memory requirements.
# They must ensure reproducibility of the generated series (to validate simulation results across different conditions).


# Modern RNG methods are often based on recursive algebraic algorithms,
# starting from a seed (an arbitrary chosen value or vector of values), recursively generating new values from previously generated ones.

# A simple and motivating example:
# 1. you throw nsim grains of sand within a square of side l=2
# 2. you count how many falls within the circle inscribed in the square.
# 3. The proportion of grains falling within the circle out of the total
#    is an approximation of the ratio between the areas of circle and square:
# 4. You can compute π simply inverting the formula! π ≈ (Acircle / Asquare)*l2


## Fix the seed of the pseudo-random generator of R
set.seed(321)

nsim <- 1000

##  We simulate nsim observations from a uniform distribution
##  on the square [-1,1]x[-1,1].
### These values represent the coordinate where the grains fall in the square

x_coord <- runif(nsim,-1,1)
y_coord <- runif(nsim,-1,1)

df_grains <- cbind(x_coord,y_coord)
df_grains
### Let's give a look at our square with the thrown sand

### Plot the square

## first draw an empty graph
plot(c(0,0),xlim=c(-1.2,1.2),ylim=c(-1.2,1.2),type="n", asp=1)
## plot the square
segments(x0 = -1,y0 = 1,x1 = 1,y1 = 1,lwd=2)
segments(-1,-1,-1,1,lwd=2)
segments(-1,-1,1,-1,lwd=2)
segments(1,-1,1,1,lwd=2)

##### plot the circle 
### we will use polar coordinate 
tt <- seq(0,2*pi,length=200)
lines(sin(tt),cos(tt),col="red",lwd=2)



## We trow the sand
points(df_grains,col="blue",pch=20,cex=1)

# We can redraw the circle if needed
lines(sin(tt),cos(tt),col="red",lwd=2)

### How many grains of sand fall in the circle with center in (0,0) and radius 1?
# These are those points whose distance from the center is smaller or equal than 1

## First we compute the distance of each point from the origin
dist_from_center <- apply(df_grains, MARGIN = 1,FUN = function(grain_coord) sqrt(grain_coord[1]^2+grain_coord[2]^2)) # alternatively: check the norm function

## Which are the grains that fall inside the circle?
ind_in_the_circle <- which(dist_from_center<=1)

#how many grains fall inside the circle?
n_inside <- length(ind_in_the_circle)
### Let's take a look
## the grains inside the circle
points(df_grains[ind_in_the_circle,],col="red",pch=20)

# Let's approximate the ratio between the areas of the square and circle
A_circle_over_A_square <- n_inside/nsim

l_square <- 2
A_square <- 2^2
simulated_pi <- A_circle_over_A_square*A_square
print(simulated_pi)


install.packages("jsonlite")
