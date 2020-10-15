#Linear Programming


##Xi>=0
###install.packages('linprog')
library(linprog)                 #Loading lpSolve library
#~~~~~~~~~~~~~~
# z= 1100x + 800y
#  x + 1.5y <= 750
# 2x +    y <= 1000
#  x        >= 0
#         y >= 0
#~~~~~~~~~~~~~~
cvec <- c(1100, 800 )  
names(cvec) <- c("x1","x2")


bvec <- c(750, 1000 )
names(bvec) <- c("b1","b2")


## Matrix A
Amat <- rbind( c( 1,  1.5 ),
               c( 2,    1 ))


## Constraints dir
c_dir <- c( "<=",
            "<=")




solveLP( cvec, bvec , Amat ,maximum = 1, const.dir = c_dir)