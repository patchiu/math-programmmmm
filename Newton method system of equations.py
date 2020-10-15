#Newton method system of equations

## module newtonRaphson2
''' soln = newtonRaphson2(f,x,tol=1.0e-9).
    Solves the simultaneous equations f(x) = 0 by
    the Newton-Raphson method using {x} as the initial
    guess. Note that {f} and {x} are vectors.
'''
from numpy import zeros,dot
from math import sqrt

def newtonRaphson2(f,x,tol=1.0e-9,ite=30):
    
    def jacobian(f,x):
        h = 1.0e-4
        n = len(x)
        jac = zeros((n,n))
        f0 = f(x)
        for i in range(n):
            temp = x[i]
            x[i] = temp + h
            f1 = f(x)
            x[i] = temp
            jac[:,i] = (f1 - f0)/h
        return jac,f0
    
    for i in range(ite):
        jac,f0 = jacobian(f,x)
        if sqrt(dot(f0,f0)/len(x)) < tol: return x
        dx = numpy.linalg.solve(jac,-f0)
        x = x + dx
        if sqrt(dot(dx,dx)) < tol*max(max(abs(x)),1.0): return x
    print ('need more iterations')


def f(x):
 f = np.zeros(len(x))
 f[0] = math.sin(x[0]) + x[1]**2 + math.log(x[2]) - 7.0
 f[1] = 3.0*x[0] + 2.0**x[1] - x[2]**3 + 1.0
 f[2] = x[0] + x[1] + x[2] - 5.0
 return f
x = np.array([1.0, 1.0, 1.0])
print(newtonRaphson2(f,x,ite=30))


##output [0.59905376 2.3959314  2.00501484]
