diary hw1_diary.out

%% first problem

X = [ 1 1.5 3 4 5 7 9 10];

Y_1 = - 2 + 0.5 * X;
Y_2 = - 2 + 0.5 * X .^ 2;

plot(X, Y_1, X, Y_2);



%% second problem

X = linspace( -10, 20, 200);
s = sum(X);



%% third problem

A = [ 2 4 6; 1 7 5; 3 12 4];
b = [ -2; 3; 10];
C = A'* b;

% note we can write in two ways
% D = (A' * A)\b;
D = inv(A' * A) * b;

E = sum (A' * b);
[F, ps] = removerows(removerows(A, 'ind', [2])', 'ind', 3);
F = F';
x = A\b;



%% fourth problem

I = eye(5);
B = kron(I, A);



%% fifth problem
% change for notation purposes AA instead of A
% denote the final output AC

AA = normrnd(10, 5, [5,3]);
AC = AA >= 10;



%% sixth problem 

filename = 'datahw1.csv';

% csvread replaces NaNs with zeros creating a little bias in eatimates
M = csvread(filename);

% extract the production function from M

P = M(:, 5);

M = (removerows(M', 'ind', [1 5]))';
M(:,1) = 1;

% define the values of beta and sigma

[beta, sigma, EE, CovB, logL] = mvregress(M, P, 'algorithm', 'cwls');
std = diag(CovB) .^ 0.5;
% It's better to either use your own written estimation rotunes or use
% econometrics toolbox in matlab

diary off