% loading the prerequisites 
addpath('/Users/mihai/Desktop/Second year/Empirical Methods/Lectures/CEtools');


%% Problem 1

[x, w]=qnwequi(50000, [0,0], [1,1], 'N'); 
test1=x(:,1).^2 + x(:,2) .^ 2 <= 1; 
pi_1=4 * w' * test1; 


%% Problem 2

f = @(x, y)(double(x .^ 2 + y .^ 2 <= 1));

% use function to get points
[x_2, w_2] = weights(25000, 0, 1);
f_val = zeros(25000, 25000);

for i = 1 : length(x_2)
    f_val(i, :) = f(repmat(x_2(i), 1, length(x_2)), x_2');
end


pi_2 = 4 * w_2'* f_val * w_2;

%% Problem 3

[x_3, w_3] = qnwequi(50000, 0,1, 'N'); 
pi_3 = 4 * w_3' * (1 - x_3 .^ 2) .^ 0.5; 