%% problem 1
% just define the values

v_a = 2;
v_b = 2;
p_a = 1;
p_b = 1;

fprintf('Demand for A is %.2f and Demand for B is %.2f\n', demand(v_a, p_a, v_b, p_b), demand(v_b, p_b, v_a, p_a))




%% problem 2
% keep v_a = v_b = 2

p = [1 2];
f = @(x) [x(1) - 1/( 1 - demand(v_a, x(1), v_b, x(2))); x(2) - 1/(1 - demand(v_b, x(2), v_a, x(1)))];
iJac = inv(myJac(f, p));

maxit = 100; 
tol = 1e-10; 
tic
p_sol = broyden(maxit, tol, f, p, iJac);
toc