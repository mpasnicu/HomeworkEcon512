%% problem 1
% just define the values

v = [2 2];
p = [1 1];

fprintf('Demand for A is %.2f and Demand for B is %.2f\n', demand(v, p), demand(fliplr(v), fliplr(p)))




%% problem 2
% keep v_a = v_b = 2

p = [1 5];
f = @(x) [x(1) - 1/( 1 - demand(v, x)); x(2) - 1/(1 - demand(fliplr(v), fliplr(x)))];


tic
p_sol = broyden(f, p);
toc



%% problem 3


pold = [1 1];
pnew = [2 5];

tol = 1e-8;
maxit = 100;

tic
for iter =1:maxit
    fprintf('iter %d: p(1) = %f, p(2) = %f\n', iter, pnew(1), pnew(2));
    faVal = f(pnew);
    fbVal = f(fliplr(pnew));
    
    if abs(max(faVal,fbVal)) < tol
        break
    else
    
    g=@(pa) f([pa, pnew(2)]);
    gold=g(pold(1));
    gVal = g(pnew(1));
    paNew = pnew(1) - ( (pnew(1) - pold(1)) / (gVal - gold) )* gVal;
    pold(1) = pnew(1);
    pnew(1) = paNew;
    
    
    g=@(pb) f([pnew(1), pb]);
    gold=g(pold(2));
    gVal = g(pnew(2));
    pbNew = pnew(2) - ( (pnew(2) - pold(2)) / (gVal - gold) )* gVal;
    pold(2) = pnew(2);
    pnew(2) = pbNew;
  
    end
end
toc
