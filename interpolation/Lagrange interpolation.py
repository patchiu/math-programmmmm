#Lagrange interpolation

from scipy.interpolate import lagrange
x = np.array([-1, 0, 1, 2])
y = np.array([1, 1, 2, 0])
poly = lagrange(x, y)


from numpy.polynomial.polynomial import Polynomial
print (Polynomial(poly).coef)
print ('x^n...x^n-1..........x^1..x^0')