% just a file with the parameters

global L c beta t_0 t_1 delta lambda error eta maxiter v; 


L = 30;
ro = 0.85;
k = 10;
l = 15;
v = 10;
delta = 0.03;
beta = 1 / 1.05;
lambda = 1;
eta = log(ro) / log(2);
maxiter = 1000;
error = 10e-5;

% cost function
c = zeros(L, 1);
c(1 : l) = k * [1 : l]' .^ eta;
c(l + 1: L)= k * ones(L - l, 1) * l .^ eta;



% transition probability for q = 0, 1 respectively

t_0 = diag([1 (1 - delta) .^ (2 : 1 : L)], 0) + diag(1 - (1 - delta) .^ (2 : 1 : L), - 1) ;
t_1 = diag([1 - (1 - delta) .^ (1 : 1 : L - 1) 1], 0) + diag((1 - delta) .^ (1 : 1 : L - 1), 1);
