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


# data frames

# they are a class of objects to represent data matrices
# rows are statistical units
# columns are variables

head(iris, n = 10)


str(iris)

# new data frames are usually created with the data.frame() function.
# beware: data.frame()’s default behaviour turns strings into factors


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

