addpath('/Users/mihai/Desktop/Second year/Empirical Methods/Lectures/CEtools');

data = load('/Users/mihai/Desktop/Second year/Empirical Methods/homework5/hw5.mat');
% do not use absolute path, it is different on every computer. I think I
% told you that before multiple times.
X = data.X';
Y = data.Y';
Z = data.Z';

clear data;


%% question 1

% generate values

[x, w] = qnwnorm(20, 0.1, 1); 
nodes.nx = x;
nodes.ny = 0;

l1 = like(0, w, nodes, Y, X, Z);



%% question 2

rng(100);
nodes2.nx = randn(100, 1) + 0.1;
nodes2.ny = 0;
w2 = 1 / length(nodes2.nx);

l2 = like(0, w2, nodes2, Y, X, Z);



%% question 3 - Gaussian Quadrature

f31 = @(x) zero_gauss(x(1), x(2), x(3), Y, X, Z);
x31 = [1, 1, 1];

[arg31, fval31] = fminsearch(f31, x31);
% you were told to use fmincon, it allows to use only one function and
% impose constraints to your liking.



%% question 3 - Monte Carlo

f32 = @(x) zero_mc(x(1), x(2), x(3), Y, X, Z);
x32 = [1, 1, 1];
e = 0;
t = 1;

while (e ~= 1) && (t < 10)
    tic
    [x32, fval32, e] = fminsearch(f32, x32);
    t = t + 1;
    toc
end




%% question 4

f4 = @(x) nonzero_mc(x(1), x(2), x(3), x(4), x(5), Y, X, Z);
x4 = [1, 1, 1, 1, 0.1];

[arg4, fval4, exit4] = fminsearch(f4, x4);
% again, this does not use fmincon, you need to read assignment more
% carefully
% it takes very long time, you need to profile the code so that to avoind
% bottlenecks

