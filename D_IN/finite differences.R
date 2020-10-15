#Forward differencing function

finite.differences <- function(x, y) {
  if (length(x) != length(y)) {
    stop('x and y vectors must have equal length')
  }
  n <- length(x)
  # Initialize a vector of length n to enter the derivative approximations
  fdx <- vector(length = n)
  # Iterate through the values using the forward differencing method
  for (i in 2:n) {
    fdx[i-1] <- (y[i-1] - y[i]) / (x[i-1] - x[i])
  }
  # For the last value, since we are unable to perform the forward differencing method 
  # as only the first n values are known, we use the backward differencing approach
  # instead. Note this will essentially give the same value as the last iteration 
  # in the forward differencing method, but it is used as an approximation as we 
  # don't have any more information
  fdx[n] <- (y[n] - y[n - 1]) / (x[n] - x[n - 1])
  return(fdx)
}

finite <- finite.differences(x, fx)

###############################

f <- function(x) {
  return(exp(x) - 2 * x^2 + 3 * x - 1)
}

central.difference <- function(f, x) {
  steps <- c(0.1, 0.01, 0.001, 0.0001, 0.00001, 0.000001, 0.0000001)
  n <- length(steps)
   
  fdx <- vector(length = n)
   
  for (h in 1:n) {
    fdx[h] <- (f(x + 0.5 * steps[h]) - f(x - 0.5 * steps[h])) / steps[h]
  }
   
  return(fdx)
}

for (i in x) {
  print(central.difference(f, i))
}

