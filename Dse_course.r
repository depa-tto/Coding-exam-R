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


