#gradient descent nd




from numpy import *
import matplotlib.pyplot as plt


def computeCost(X, y, theta):
    m = size(y);
    return (1.0 / (2.0 * m)) * sum(power(X * theta - y, 2));


def gradientDescent(X, y, theta, alpha, num_iters):
    m = size(y)
    n = size(theta)
    tmp = zeros((n,1))
    for iter in xrange(1, num_iters + 1):
        for initer in xrange(0, n):
            tmp[initer] = theta[initer] - alpha * (1.0 / m) * sum(transpose(X * theta - y) * X[:,initer])
        theta = tmp
    return theta        


if __name__ == '__main__':
    data = matrix(genfromtxt('aba67', dtype=float, delimiter=','))


    X = data[:, 0] 
    y = data[:, 1]
    m = size(y)


    oneX = concatenate((ones((m,1)), data[:,0]), axis = 1)
    theta = zeros((2,1))


    print computeCost(oneX, y, theta)


    iterations = 3000
    alpha = 0.1


    theta = gradientDescent(oneX, y, theta, alpha, iterations)


    plt.plot(X, y, 'rx')
    plt.plot(oneX[:,1], oneX * theta, '-')
    plt.xlabel('Shucked weight')
    plt.ylabel('Viscera weight')
    plt.show()