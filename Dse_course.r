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
