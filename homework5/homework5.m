addpath('/Users/mihai/Desktop/Second year/Empirical Methods/Lectures/CEtools');

data = load('/Users/mihai/Desktop/Second year/Empirical Methods/homework5/hw5.mat');

X = data.data.X';
Y = data.data.Y';
Z = data.data.Z';

clear data;


%% question 1

% generate values

[x, w] = qnwnorm(20, 0.1, 1); 
nodes.nx = x;
nodes.ny = 0;
l1 = like(0, w, nodes, Y, X, Z);



%% question 2


