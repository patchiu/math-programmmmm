##explicit Euler method (1D)

def odeEuler(f,t,y0):
    '''Approximate the solution of y'=f(t,y) by Euler's method.

    Parameters
    ----------
    f : function
        Right-hand side of the differential equation y'=f(t,y), y(t_0)=y_0
    t : array
        1D NumPy array of t values where we approximate y values. Time step
        at each iteration is given by t[n+1] - t[n].
    y0 : number
        Initial value y(t0)=y0 wher t0 is the entry at index 0 in the array t

    Returns
    -------
    y : 1D NumPy array
        Approximation y[n] of the solution y(t_n) computed by Euler's method.
    '''
    y = np.zeros(len(t))
    y[0] = y0
    for n in range(0,len(t)-1):
        y[n+1] = y[n] + f(t[n],y[n])*(t[n+1] - t[n])
    return y


t = np.linspace(0,2,21)
y0 = 1
f = lambda t,y: y

y = odeEuler(f,t,y0)

y_true = np.exp(t)
