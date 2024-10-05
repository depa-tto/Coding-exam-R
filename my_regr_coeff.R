my_rc <- function(X, Y, add_intercept = TRUE) {
  n <- length(X)
  if (add_intercept) {
    X2 <- cbind(rep(1, n), X)
    # t(X) returns the transpose of X
    # solve(X) returns the inverse of X
    b <- solve(t(X2) %*% X2) %*% t(X2) %*% Y
  }
  if (!add_intercept) {
    b <- solve(t(X) %*% X) %*% t(X) %*% Y
    names(b) <- "beta_1"
  }
  if (length(b) > 1)
    return(list(beta_0 = b[1], beta_1 = b[2]))
  if (length(b) == 1)
    return(list(beta_1 = b[1]))
}