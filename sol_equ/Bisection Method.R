#Bisection Method


#bisection(f, a, b, num = 10, eps = 1e-05)
#Arguments
#f
#the objective function which we will use to solve for the root
#a
#mininum of the interval which cantains the root from Bisection Method
#b
#maxinum of the interval which cantains the root from Bisection Method
#num
#the number of sections that the interval which from Bisection Method
#eps
#the level of precision that |x(k+1)-x(k)| should be satisfied in order to get the idear real root. #eps=1e-5 when it is default


###############code###################


bisection <- function(f, a, b, n = 1000, tol = 1e-7) {
  # If the signs of the function at the evaluated points, a and b, stop the function and return message.
  if (!(f(a) < 0) && (f(b) > 0)) {
    stop('signs of f(a) and f(b) differ')
  } else if ((f(a) > 0) && (f(b) < 0)) {
    stop('signs of f(a) and f(b) differ')
  }
  
  for (i in 1:n) {
    c <- (a + b) / 2 # Calculate midpoint
    print(c)
    # If the function equals 0 at the midpoint or the midpoint is below the desired tolerance, stop the 
    # function and return the root.
    if ((f(c) == 0) || ((b - a) / 2) < tol) {
    
      return(c)
    }
    
    # If another iteration is required, 
    # check the signs of the function at the points c and a and reassign
    # a or b accordingly as the midpoint to be used in the next iteration.
    ifelse(sign(f(c)) == sign(f(a)), 
           a <- c,
           b <- c)
  }
  # If the max number of iterations is reached and no root has been found, 
  # return message and end function.
  print('need more iterations')
}








##############################


func <- function(x) {
  x^3 - 2 * x - 5
}


curve(func, xlim=c(-4,4), col='blue', lwd=1.5, lty=2)
abline(h=0)
abline(v=0)




bisection(func, -50, 4, 10, 1e-7)