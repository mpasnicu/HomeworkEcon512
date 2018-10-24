function l = log_lik(X, Y, beta)

l = - sum(exp((X * beta'))) + Y' * X * beta';


end
    