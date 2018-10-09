function [t, b_sol] = hw3_code(b)

t = zeros(1 ,4);
b_sol = zeros(4 ,6);
M = load('hw3.mat');
x = M.X;
y = M.y;

%% problem 1

b1 = b;
f =@(b) - log_lik(x ,y ,b);

maxit = 100;
tic
for i = 1: maxit

    [b1, fval, exit] = fminsearch(f, b1, optimset('Display','final','TolFun',1e-16,'TolX',1e-16));
    if (exit == 1)
        break
    end
end
t(1) = toc;
b_sol(1, :) = b1;


%% problem 2
b2 = b;
f2 = @(b) norm(log_lik(x, y, b));

tic
b2 = fminunc(f2, b2, optimset('Display','final'));
t(2) = toc;
b_sol(2, :) = b2;


%% problem 3
b3 = b;
f3 = @(b)y-exp(x * b');

tic
b3 = lsqnonlin(f3, b3, [], [], optimoptions('lsqnonlin','Display','final','TolFun',1e-16,'TolX',1e-16));
t(3) = toc;
b_sol(3, :) = b3;




%% problem 4
b4 = b;

f4 = @(b)sum((y - exp(x * b')) .^ 2);

tic
for i = 1: maxit

    [b4, fval, exit] = fminsearch(f4, b4, optimset('Display','final','TolFun',1e-16,'TolX',1e-16));
    if (exit == 1)
        break
    end
end
t(4) = toc;
b_sol(4, :) = b4;
end