#LU decomposition
#(A = PLA)

import scipy.linalg
A = scipy.array([[1, 2, 3],
                 [4, 5, 6],
                 [10, 11, 9]])
P, L, U = scipy.linalg.lu(A)
print(P)
print(L)
print(U)