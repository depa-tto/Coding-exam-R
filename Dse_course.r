# ====================================
#              Lecture 1
# ====================================


getwd() # retrives the current working directory

# setwd(): changes the working directory

ls() # lists the objects present in the workspace

rm() # deletes one or more specified objects from the workspace

rm(list = ls()) # removes all objects from the workspace.

library() # lists the installed packages in the library specified by .libPaths()

library()

# ====================================
#           Lecture 2
# ====================================


x <- 14.33 # decimal values are called 'numeric' in R
class(x)

typeof(x)

x <- 10
class(x) # so even if an integer is assigned to a variable, it is still numeric

x <- as.integer(11)
is.integer(x)

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

# logical operations

u <- TRUE
v <- FALSE
u & v

address <- 'Via'
domain <- 'Conservatorio'
paste(address, domain, sep = ' ') # two character values can be concatenated with the paste function

my_str = 'Via Conservatorio'
sub('Via', 'Piazza', my_str) # with sub we can substitute terms in a string

# vectors

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

x <- c(14,12,6) # vector
n <- c('Tottenham', 'Aston Villa', 'Brentford') # vector of names
names(x) <- n # assigning names
x

# matrix

M <- matrix(data = c(1,2,3,4,5,6), # data elements
        ncol = 3, # number of columns
        nrow = 2, # number of rows
        byrow = TRUE) # fill matrix by rows

M

rn <- c('row1', 'row2')
cn <- c('col1', 'col2', 'col3')

rownames(M) <- rn
colnames(M) <- cn

M

# list

# a list is a collection of objects. is the most general and flexible element in R
# because the can contain elements of any type, including other lists

new_list <- list(
        A = matrix(c(1,2,3,4), ncol = 2),
        y = c(5,6,7,8)
)

new_list

# factors

# they are used to represent categorical data and can be either ordinal,
# for examplw company hierarchies, or non ordinal

# a factor MUST be imagined as a vector of integers,
# where each integer is associated with a label


x <- factor(c("yes", "yes", "no"))
x # by default, the levels are ordered alphabetically

# additionally, if the levels have a hierarchy (e.g., soldier, lieutenant, marshal, etc.),
# we can indicate this by specifying ordered = TRUE in the factor function.

str(x)

table(x) # we get back a table with the levels and frequencies of the variables


# data frames

# they are a class of objects to represent data matrices
# rows are statistical units
# columns are variables

head(iris, n = 10)


str(iris)

# new data frames are usually created with the data.frame() function.
# beware: data.frame()’s default behaviour turns strings into factors

# to avoid the problem of converting strings into factors,
# we can use 'stringAsFactors' = FALSE

v1 <- c(10,20,30)                                # numeric vector
v2 <- c('a','b','c')                             # character vector
v3 <- c(TRUE,TRUE,FALSE)                         # logical vector
data.frame(v1, v2, v3, stringsAsFactors = FALSE) # data.frame

s = c("a"=5, "b"=4, "c"=3, "d"=2, "e"=1)
s[3] # subsetting vectors

s[-3] # dropping elements

s[10] # IMPORTANT: out of range index returns NA

indx <- c(2,3,4) # we can retrive more than one element
s[indx]

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

M[2,3]

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

i <- M[, 'c3'] < 2 * M[, 'c1']
M[i, 'c4']

M

# subsetting lists

new_list
new_list[2] # we take the second element of the list that is a vector

new_list[[2]]

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
y <- c(0, 1, 2, 3, 4, 5, 6, 7)

# so in this case the 2 vectors have different lenghts,
# and their sum is computed by recycpling values of the shorter vector

x + y 

a <- 1
x + a

b <- 2
x * b

M <- matrix(1:16, ncol = 4, nrow = 4, byrow = TRUE)
M + a
M * b

M
M + x # sum the vector x by column 
M
M * x # product between the vector and the columns of the matrix

N <- M <- matrix(1:20*10, ncol = 5, nrow = 4, byrow = TRUE) # by 50

M
N
M + N

M %*% x # matrix product

M
x
M * x # product between the elements in the vector and the columns of the matrix


x <- c(100, 200, 300, 400, 500)
y <- c(1, 2, 3, 4, 5)
x %*% y # vector multiplication


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
# so if a vector is passed into an is, it checks only
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

# which function returns the array indeces that meet
# a specific condition

v1 <- c(10, 20, 30) # numeric vector
v2 <- c('a', 'b', 'c') # character vector
v3 <- c(TRUE, TRUE, FALSE) # logical vector

my_data <- data.frame('c1' = v1, 
                      'c2' = v2, 
                      'c3' = v3, 
                      stringsAsFactors = FALSE)
my_data

# we want alle the row numbers where column c1 is greater
# than or eual to 20

which(my_data$c1 >= 20)

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
# uniform distribution (0,1), 5 values from a normal (1,sqrt(2)):

x <- c(rnorm(n = 5), runif(n = 5), rnorm(n = 5, mean = 1,sd = 2))
f <- gl(3, 5) # generate levels (as.factor(rep(1:3, each=10)))
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

range <- range(1,10)
v <- seq(range[1], range[2], by=2)
for (i in v){
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
# without terminatinf it

x <- 1:4
for (i in x){
        if (i == 2){
                next
        }
        print(i)
}

# functionals: function that takes a function as an input
# and returns a vector as output

# lapply() function applies a function to each element of a list
# returnin a list

x <- list(a = 1:10, b = 1:100, c = c(1,2,3,5,6,7,8))
lapply(X=x, FUN=mean)

lapply(X = 1:4, FUN = runif) # runif() generates random deviates from U(min,max) whit default min=0,max=1

# when you pass a function to lapply(), it takes elements of the 
# list and passes them as the first argument of the function you are applying

set.seed(33) # with for loops
res <- vector(mode = "list",length = 4)
for (i in 1:4) {
  res[[i]] <- runif(n = i,min = 0,max = 10)
}
res

set.seed(33) # with lapply using the dot-dot-dot argument
(res <- lapply(X = 1:4, FUN = runif, min=0,max=10))


set.seed(33) # with lapply explicitly defining FUN
(res <- lapply(
  X = 1:4,
  FUN = function(num)
    runif(n = num, min = 0, max = 10)
))

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

# example returning a matrix

BOD

sapply(BOD, function(x) 10 * x)
