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

z <- 5+2i
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
n <- c('Tottenham','Aston Villa','Brentford') # vector of names
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
