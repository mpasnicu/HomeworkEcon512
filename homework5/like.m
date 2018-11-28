function l = like( gamma, weights, nodes, Y, X, Z)
% function for computing the likelihood function

% INPUTS: 
% gamma - coefficients of Z
% wieghts - matrix of weights for beta_i and u_i
% nodes - nodes for integrating for beta_i and u_i
% Y - N * T matrix fo choice variables
% X - scalar matrix N * T
% Z - scalar matrix N * T

% OUTPUT:
% l = value of function

s = size(Y); 
s1 = s(1); 
s2 = s(2); 
l1 = zeros(s1, 1); 
nx = nodes.nx; 
ny = nodes.ny; 
s31 = length(nx); 
s32 = length(ny);


for i = 1 : s1
    t1 = ones(s31, s32, s2);
    
    for j = 1 : s2
        
        for  k = 1 : s31
            
            for m = 1 : s32
                
                t1(k, m, j)=exp(Y(i, j) * (nx(k) * X(i, j) + gamma * Z(i, j) ...
                    + ny(m)))/(1 + exp(nx(k) * X(i, j) + gamma * Z (i, j) + ny(m)));
            end
        end
    end
    
    l1(i) = sum(sum(prod(t1, 3) .* weights));
end
l = sum(log(l1));
end