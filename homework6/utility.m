function u = utility(p,x)
% just a function for the utility function
% gives -infinity for 0 

x_1 = x .* (x >= 0);
out = p .* x_1 - 0.2 * x_1 .^ 1.5;
u = out - 100 * (x<0);
end