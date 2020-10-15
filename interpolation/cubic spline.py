cubic spline coefficients
Output b,c,d
##############################
import numpy as np
import scipy.linalg as la

def cubic_spline_coeffs(x, y, endpoint="natural"):
    """ Computes the coefficients in the cubic spline that interpolates
    the points (x_1,y_1), (x_2, y_2),..., (x_n, y_n).
    Parameters:
        x: array_like, shape (n>2,).
           x-value of the points being interpolated. Values must be
           real and in strictly increasing order.
        y: array_like, shape (n>2,)
           y-value of the points being interpolated. Values must be
           real.
    Returns:
        array, shape (3, n). The coefficients b, c and d, stored in
        the first, second and third row, respectively.
        S_i(x)= y_[i-1]+b_[i-1](x-x[i-1])+c_[i-1](x-x[i-1])^2+d_[i-1](x-x[i-1])^3
    """
    x = np.asarray(x)
    y = np.asarray(y)
    n = len(x)
    dx = np.diff(x)
    dy = np.diff(y)

    # Find the vector for the right hand side
    rhs = np.zeros(n)
    rhs[1:-1] = 3*(dy[1:]/dx[1:] - dy[:-1]/dx[:-1])

    # Compute the matrix and store a matrix diagonal ordered form
    if (endpoint == "natural"):
        matrix = np.zeros((3, n))
        bands = (1, 1)
        matrix[1, 1:-1] = 2*(dx[:-1] + dx[1:]) # Diagonal
        matrix[1, 0] = matrix[1, -1] = 1
        matrix[0, 2:] = dx[1:] # Upper diagonal
        matrix[2, :-2] = dx[:-1] # Lower diagonal
    
    if (endpoint == "not-a-knot"):
        matrix = np.zeros((5, n))
        bands = (2, 2)
        matrix[2, 1:-1] = 2*(dx[:-1] + dx[1:]) # Diagonal
        matrix[1, 2:] = dx[1:] # Upper diagonal
        matrix[3, :-2] = dx[:-1] # Lower diagonal
        # First row
        matrix[2, 0] = dx[1]
        matrix[1, 1] = -dx[0] - dx[1]
        matrix[0, 2] = dx[0]
        # Last row
        matrix[2, -1] = dx[-2]
        matrix[3, -2] = -dx[-2] - dx[-3]
        matrix[4, -3] = dx[-1]
        
    # Call a solver for a banded matrix
    c = la.solve_banded(bands, matrix, rhs,overwrite_ab=True, overwrite_b=True, check_finite=False)
    
    # Find the remainding coefficients
    d = np.diff(c)/(3*dx)
    b = dy/dx - dx*(2*c[:-1] + c[1:])/3
    return b, c, d

def func(x):
    return np.sin(x)

xdata = np.asarray([0, 2, 4, 6, 8, 10])*np.pi/5
ydata = func(xdata)
cubic_spline_coeffs(xdata, ydata, "natural")


########################
def cubic_spline_eval(x, xdata, ydata, b, c, d):
    """ Evaluates the cubic spline that interpolates {(xdata, ydata)}
    at x with coefficients b, c and d.
    Parameters:
        x:          array_like, shape(m,).
                    x-values (axis) at which the spline is evaluated.
           b, c, d: array_like, shapes (n-1)
                    Coefficients of the spline.
    Return:
        array, shape(m,). Function evaluation of the spline.
    """
    x = np.asarray(x)
    y = np.zeros(len(x))
    m = 0
    for i in range(len(xdata) - 1):
        n = np.sum(x < xdata[i + 1]) - m
        xx = x[m:m + n] - xdata[i]
        y[m:m + n] = ydata[i] + b[i]*xx + c[i]*xx**2 + d[i]*xx**3
        m = m + n
    xx = x[m:] - xdata[-2]
    y[m:] = ydata[-2] + b[-1]*xx + c[-2]*xx**2 + d[-1]*xx**3
    return y



