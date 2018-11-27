function l = nonzero_mc(gamma, mu, s_u, s_b, s_ub, Y, X, Z)

sigma = [s_b s_ub; s_ub s_u];
u = chol(sigma)';
x = randn(1, 100);
y = randn(1, 100);

points = u * [x; y] + repmat([mu; 0], 1, 100);
nodes.nx = points(1, :);
nodes.ny = points(2, :);
w = 1 / 10000;
l = - like(gamma, w, nodes, Y, X, Z);
end