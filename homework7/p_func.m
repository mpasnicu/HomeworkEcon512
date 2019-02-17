function new_p = p_func(W_0, W_1, W_2, old_p)

global L c beta D_0 D_1 D_2; 

new_p = zeros(L, L);

for w_1 = 1 : L
    for w_2 = 1 : L
        f = @(p_1)(- D_1(p_1, old_p(w_2,w_1)) * (p_1 - c(w_1)) - beta *(D_0(p_1, old_p(w_2,w_1)) * W_0(w_1, w_2) ...
                  + D_1(p_1, old_p(w_2,w_1)) * W_1(w_1, w_2) + D_2(p_1, old_p(w_2, w_1)) * W_2(w_1, w_2))); 
        
        p_0 = 0.4;
        new_p(w_1, w_2) = fminsearch(f, p_0);
    end
end