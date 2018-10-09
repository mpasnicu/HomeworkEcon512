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
b3 = [1 0 0 0 0 0];
f3 = @(b)y-exp(X * b');


b3 = lsqnonlin(f3, b3, [], [], optimoptions('lsqnonlin','Display','final','TolFun',1e-16,'TolX',1e-16));
b3



%% problem 4
b4 = [1 0 0 0 0 0];

f4 = @(b)sum((y - exp(X * b')) .^ 2);

for i = 1: maxit

    [b4, fval, exit] = fminsearch(f4, b4, optimset('Display','final','TolFun',1e-16,'TolX',1e-16));
    if (exit == 1)
        break
    end
end
toc

b4

