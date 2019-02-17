function new_V = V_func(W_0, W_1, W_2, old_p,new_p)

global L c beta D_0 D_1 D_2; 

new_V = zeros(L, L);

for w_1 = 1 : L
    for w_2 = 1 : L
        new_V(w_1, w_2) = D_1(new_p(w_1, w_2), old_p(w_2, w_1)) * (new_p(w_1, w_2) - c(w_1)) ...
                        + beta * (D_0(new_p(w_1, w_2), old_p(w_2, w_1)) * W_0(w_1, w_2) ...
                        + D_1(new_p(w_1, w_2), old_p(w_2, w_1)) * W_1(w_1, w_2) ...
                        + D_2(new_p(w_1, w_2), old_p(w_2, w_1)) * W_2(w_1, w_2));
    end
end
