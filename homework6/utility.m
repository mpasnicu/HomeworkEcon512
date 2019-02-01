function u = utility(p,x)
% just a function for the utility function
% gives -10000 for 0, since putting Inf is going to result in an error 

x_1 = x .* (x >= 0);
out = p .* x_1 - 0.2 * x_1 .^ 1.5;
u = out - 10000 * (x < 0);
end