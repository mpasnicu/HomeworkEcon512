M = load('hw3.mat');
x = M.X;
y = M.y;

%% problem 1

b1 = [3 0 0 0 0 0];
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