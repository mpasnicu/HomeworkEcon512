function [W_0, W_1, W_2]= W_func(V)

global L delta; 

W_0 = zeros(L, L);
W_1 = zeros(L, L);

for i = 1 : L 
    for j = 1 : L
        delta_i = (1 - delta) ^ i;
        delta_j = (1 - delta) ^ j;
        
        W_0(i, j) = V(i, j) * (1 - delta_i) * (1 - delta_j) + V(max(i - 1, 1), j) * delta_i * (1 - delta_j) ...
                  + V(i, max(j - 1, 1)) * (1 - delta_i) * delta_j + V(max(i - 1, 1), max(j - 1, 1)) * delta_i * delta_j;
        W_1(i, j) = V(min(i + 1, L), j) * (1 - delta_i) * (1 - delta_j) + V(i, j) * delta_i *(1 - delta_j) ...
                  + V(min(i + 1, L), max(j - 1, 1)) * (1 - delta_i) * delta_j + V(i, max(j - 1, 1)) * delta_i * delta_j;
    end
end

W_2 = W_1';