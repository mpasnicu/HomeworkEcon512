function l = zero_gauss(gamma, beta, sigma, Y, X, Z)

optset('qnwnorm','usesqrtm',1);

[x, w] = qnwnorm(100, beta, sigma);% Generate nodes
nodes.nx = x;
nodes.ny = 0;
l = -like(gamma, w, nodes, Y, X, Z);
end