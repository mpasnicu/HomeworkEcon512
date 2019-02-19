function f = func_P(old_V, old_P)

% just a function for P to be able to compute new_p with f_solve inside the
% main program

global L c beta


[D_0, D_1, D_2] = get_D(old_P, old_P');
[W_0, W_1, W_2] = get_W(old_V);

f = beta .* (D_0 .* W_0 + D_1 .* W_1 + D_2 .* W_2) - beta * W_1 - (1 - D_1) .* (old_P - repmat(c, 1, L)) + 1;

end