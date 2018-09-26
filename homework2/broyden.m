function p_sol = broyden(f, p)
maxit = 100; 
tol = 1e-10; 
iJac = inv(myJac(f, p));

fVal = f(p);
for iter = 1:maxit
    fprintf('iter %d: p(1) = %f, p(2) = %f, norm(f(x)) = %.8f\n', iter, p(1), p(2), norm(fVal));
    if norm(fVal) < tol
        break
    end
    d = - (iJac * fVal);
    p = p+d';
    fOld = fVal;
    fVal = f(p);
    u = iJac*(fVal - fOld);
    iJac = iJac + ( (d - u) * (d'*iJac) )/ (d'*u);
end

p_sol = p;
end