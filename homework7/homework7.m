%parametrization 


global L c beta D_0 D_1 D_2 delta lambda; 

L = 30;
ro = 0.85;
k = 10;
l = 15;
v = 10;
delta = 0.03;
beta = 1 / 1.05;

lambda = 1;


c = zeros(L, 1);
c(1: l) = k .* [1: l]' .^ (log(ro) / log(2));
c(l + 1: L) = c(l) .* ones(L - l, 1);
D_0= @(p_1, p_2)(1 / (1 + exp(v - p_1) + exp(v - p_2)));
D_1= @(p_1, p_2)(exp(v - p_1) / (1 + exp(v - p_1) + exp(v - p_2)));
D_2= @(p_1, p_2)(exp(v - p_2) / (1 + exp(v - p_1) + exp(v - p_2)));

V_0 = ones(L,L);
p_0 = 0.2 .* ones(L, L);
[V_f, p_f, itea] = MPE(V_0, p_0);


figure(1);
mesh(V_f);
title('Value Function');

figure(2);
mesh(p_f);
title('Policy Function');