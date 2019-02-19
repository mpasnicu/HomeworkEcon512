%% question 1
% all is good
run parameters.m
global L c beta t_0 t_1 lambda maxiter error; 

iter = 0;
maxerror = 10000;

% guesses, would make sense to call them old_P and old_V, but keep them 0
% for clarity, as being the initial guesses

P_0 = repmat(c, 1, L);                     
V_0 = ones(L, L);

% follow the steps in the homework file

tic
while ((maxerror > error) && (iter < maxiter))
   
    % computation of new values
    f = @(x) func_P(V_0, x);
    new_P = fsolve(f, P_0);
    
    [D_0, D_1, D_2] = get_D(new_P, P_0');
    [W_0, W_1, W_2] = get_W(V_0);
    new_V = D_1 .* (new_P - repmat(c, 1, L)) + beta .* (D_0 .* W_0 + D_1 .* W_1 + D_2 .* W_2);
      
    
    % iteration step
    maxerror = max(max(max(abs((new_V - V_0) ./ (1 + new_V)))),  max(max(abs((new_P - P_0) ./ (1 + new_V))))); 
    V_0 = (1 - lambda) * V_0 + lambda * new_V;
    P_0 = (1 - lambda) * P_0 + lambda * new_P;
           
      
    iter = iter + 1;
    fprintf('itaration %4.2f, difference %4.2f', iter, maxerror);
              
end

toc

 
 
figure(1)
surf((1 : 1 : L), (1 : 1 : L), new_V);
title("Value Function");
xlabel('w1');
ylabel('w2');
zlabel('value of player 1');

 
figure(2)
surf((1 : 1 : L), (1 : 1 : L), new_P);
title("Policy Function");
xlabel('w1');
ylabel('w2');
zlabel('price of player 1');
 

%% question 2

[final_D_0, final_D_1, final_D_2] = get_D(new_P,new_P');
    
D_0_state = repmat(reshape(final_D_0', L * L, 1), 1, L * L);
D_1_state = repmat(reshape(final_D_1', L * L, 1), 1, L * L);
D_2_state = repmat(reshape(final_D_2', L * L, 1), 1, L * L); 
    
state_0 = kron(t_0, t_0);
state_1 = kron(t_1, t_0);
state_2 = kron(t_0, t_1);
    
% transition matrix
pi = D_0_state .* state_0 + D_1_state .* state_1 + D_2_state .* state_2;
pi = pi ./ repmat(sum(pi, 2), 1, L * L);       

start = [1 zeros(1,899)];
   

% get the distribution of states
state_10 = reshape(start * pi ^ 10, L, L);    
state_20 = reshape(start * pi ^ 20, L, L);    
state_30 = reshape(start * pi ^ 30, L, L);    
    
figure(3)
surf(1 : 1 : L, 1 : 1 : L, state_10);
title('dist. of state after 10');
xlabel('w1');
ylabel('w2');
zlabel('prob. mass');

    
figure(4)
surf(1 : 1 : L, 1 : 1 : L, state_20);
title('dist. of state after 20');
xlabel('w1');
ylabel('w2');
zlabel('prob. mass');    


figure(5)
surf(1 : 1 : L, 1 : 1 : L, state_30);
title('dist. of state after 30');
xlabel('w1');
ylabel('w2');
zlabel('prob. mass'); 





%% question 3

maxerror = 1000;

while maxerror > 10e-10
    
    temp = start * pi;
    maxerror = norm(temp - start) / norm(start);
    start = temp;
end

stat_dis = reshape(temp, L, L);
   
figure(6)
    
surf(1 : 1 : L, 1 : 1 : L, stat_dis);
title('stationary dist. of state');
xlabel('w1');
ylabel('w2');
zlabel('prob. mass');
    

