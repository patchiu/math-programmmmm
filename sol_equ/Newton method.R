####Newton method




####################code#######################


install.packages('numDeriv')


newton.raphson <- function(f, a, b, tol = 1e-5, n = 1000) {
  require(numDeriv) # Package for computing f'(x)
  
  x0 <- a # Set start value to supplied lower bound
  k <- n # Initialize for iteration results
  
  # Check the upper and lower bounds to see if approximations result in 0
  fa <- f(a)
  if (fa == 0.0) {
    return(a)
  }
  
  fb <- f(b)
  if (fb == 0.0) {
    return(b)
  }
  print('x0')
  print(x0)
  for (i in 1:n) {
    print('')
    dx <- genD(func = f, x = x0)$D[1] # First-order derivative f'(x0)
    print('df(xn)=')
    print(dx)
    print('f(xn)=')
    print(f(x0))
    x1 <- x0 - (f(x0) / dx) # Calculate next value x1
    print('xn+1=')
    print(x1)
    print('')
    print('~~~~~~~~~~~')
    
    k[i] <- x1 # Store x1
    # Once the difference between x0 and x1 becomes sufficiently small, output the results.
    if (abs(x1 - x0) < tol) {
      root.approx <- tail(k, n=1)
      res <- list('root approximation' = root.approx, 'iterations' = k)
      print('~~~~~~~~~~~')
      return(res)
    }
    # If Newton-Raphson has not yet reached convergence set x1 as x0 and continue
    x0 <- x1
  }
  print('Too many iterations in method')
}
##########################################


func2 <- function(x) {
   12*x^3-8*x^2-6*x+4
   }




curve(func2, xlim=c(-10,10), col='blue', lwd=2, lty=2, ylab='f(x)')
abline(h=0)
abline(v=0)


newton.raphson(func2, 1.13, 5,1e-17)