function d = demand(v, p)

% just define the demand as a function
d = exp(v(1) - p(1))/( 1 + exp(v(1) - p(1)) + exp(v(2) - p(2)));

end
