

import numpy as np

def newtonsDividedDifference(x_data,y_data):
    """Calculates the coeffisients of the interpolatiol polynomial 
    from n data points using Newton's divided difference.
    Parameters:
        x_data: float arr. All the x-values of the data set.
        y_data: float arr. All the y-values of the data set.
                x_data and y_data has to be of the same length.
    Returns:
        c:      float arr. The coeffisients of the interpolation polynomial.
        
        P_n=c_0(x-x_1)+c_1(x-x_1)(x-x_2)+.......



    """
    n = len(x_data) - 1
    c = y_data.copy()
    for i in range(1, n + 1):
        for j in range(n, i - 1 , -1):
            c[j] = (c[j] - c[j - 1])/(x_data[j] - x_data[j - i])
    return c


x_data = [1.0, 4.0, 7.0, 10.0, 11.0, 2.0]
y_data = [1.2, 1.1,-9.1,  1.0,  1.0, 0.0]

c = newtonsDividedDifference(x_data, y_data)
print(‘newtonsDividedDifference’)
print(c)
