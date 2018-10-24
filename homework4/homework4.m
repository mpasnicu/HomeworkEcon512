% loading the prerequisites 
addpath('/Users/mihai/Desktop/Second year/Empirical Methods/Lectures/CEtools');


%% Problem 1

[x, w]=qnwequi(50000, [0,0], [1,1], 'N'); 
test1=x(:,1).^2 + x(:,2) .^ 2 <= 1; 
pi_1=4 * w' * test1; 