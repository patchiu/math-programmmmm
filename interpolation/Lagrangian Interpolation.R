##install.packages('polynom')
library(polynom)
library(ggplot2)

x <- c(0, 2, 3, 4,5)
y <- c(7, 11, 28, 63,98)

dat <- data.frame(cbind(x, y))

ggplot(dat, aes(x=x, y=y)) + 
  geom_point(size=5, col='red')

poly.calc(x, y)

f <- function(x) {
  return(7 + 17.2*x - 20.8*x^2 + 8.2*x^3 - 0.8*x^4)      #need to change 
}

ggplot(dat, aes(x=x, y=y)) + 
  geom_point(size=5, col='blue') + 
  stat_function(fun = f, size=1.25, alpha=0.4)

