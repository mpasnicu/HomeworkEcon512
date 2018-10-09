M = load('hw3.mat');
x = M.X;
y = M.y;

%% problem 1

b1 = [1 0 0 0 0 0];
f =@(b) - log_lik(x ,y ,b);

maxit = 100;
tic
for i = 1: maxit

    [b1, fval, exit] = fminsearch(f, b1, optimset('Display','final','TolFun',1e-8,'TolX',1e-8));
    if (exit == 1)
        break
    end
end
toc
b1

%% problem 2
b2 = [1 0 0 0 0 0];
f2 = @(b) norm(log_lik(x, y, b));
tic
b2 = fminunc(f2, b2, optimset('Display','final'));
toc
b2


%% problem 3


