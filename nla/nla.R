##Matrix input


X <- matrix(0, 3, 3)
X <- edit(X)
View(X)




#################
###gaussianElimination




###install.packages("matlib")
library(matlib)




A <- matrix(c(2, 1, -1,
              -3, -1, 2,
              -2,  1, 2), 3, 3, byrow=TRUE)
b <- c(8, -11, -3)
gaussianElimination(A, b)
gaussianElimination(A, b, verbose=TRUE, fractions=TRUE)


# determine whether matrix is solvable
gaussianElimination(A, numeric(3))


# find inverse matrix by elimination: A = I -> A^-1 A = A^-1 I -> I = A^-1
gaussianElimination(A, diag(3))






#############################################
##eigen decomposition 






###install.packages("matlib")
library(matlib)


A <- matrix(c(1,  1, -1,
              2,  2,  4,
              1, -1,  1), 3, 3, byrow=TRUE)


ev <- eigen(A)


####################
####GramSchmidt


###install.packages("matlib")
library(matlib)


(xx <- matrix(c( 1:3, 3:1, 1, 0, -2), 3, 3))
crossprod(xx)


# print steps
GramSchmidt(xx, verbose=TRUE)




#######################
##LU Decomposition 




###install.packages("matlib")
library(matlib)


# permutations required in this example
A <- matrix(0, 4,4 )
A <- edit(A)
View(A)


b <- c(1, 2, 9,4)
(ret <- LU(A, b))
with(ret, P %*% A)
with(ret, L %*% U)
LU(A, b, verbose=TRUE)




##################
##Singular Value Decomposition




library(matlib)


A = as.matrix(data.frame(c(4,7,-1,8), 
                         c(-5,-2,4,2), 
                         c(-1,3,-3,6)))
A.svd <- svd(A)
A.svd