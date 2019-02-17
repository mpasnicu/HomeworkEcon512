function [V, p, iter] = MPE(V_0, p_0)


global lambda;

V = V_0;
p = p_0;
iter = 0;
error = 1e-10;
max_it = 1000;

for i = 1 : max_it
    
    [W_0, W_1, W_2] = W_func(V);
    new_p = p_func(W_0, W_1, W_2, p); 
    new_V = V_func(W_0, W_1, W_2, p, new_p);
    max_error = max(max(max(abs((new_V - V) ./ (1 + new_V)))),  max(max(abs((new_p - p) ./ (1 + new_p)))));       
    V = lambda * new_V + (1 - lambda) * V;
    p = lambda * new_p + (1 - lambda) * p;
    if (max_error < error) 
         break;
    end
    
    iter = i;
end