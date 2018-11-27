function l = zero_mc(gamma, beta, sigma, Y, X, Z)


nodes2.nx = normrnd(beta, sigma, 500, 1);
nodes2.ny = 0;
w2 = 1 / length(nodes2.nx);
l = -likelihood(gamma, w2, nodes2, Y, X, Z);
end