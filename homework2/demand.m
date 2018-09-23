function d = demand(v_a, p_a, v_b, p_b)

% just define the demand as a function
d = exp(v_a - p_a)/( 1 + exp(v_a - p_a) + exp(v_b - p_b));

end
