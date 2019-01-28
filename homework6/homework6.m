%% Question 2

[prob, grid] = tauchen(21, 0.5, 0.5, 0.1); 


%% Question 3 + 4

%% Question 3,4

% setting up parameters
delta = 0.95;
S = 1000; 
P = repmat(grid, S, 1); 
pi = prob; 
stock = linspace(0, 100, S); 
S_1 = repmat(stock', 1, length(grid));
v_init = zeros(S, length(grid));
d_init = ones(S, length(grid)); 
v_revised = ones(S, length(grid));
d_revised = ones(S, length(grid));
diff = 1;

% actual vfi
while (diff > 0.001)
    Ev=v_init*pi';
    
    for i = 1 : S
        U = utility(P, stock(i) - S_1);
        [v_revised(i, :), d_revised(i, :)] = max(U + delta * Ev);
    end
    
    diff = norm(v_revised - v_init)/ norm(v_revised);
    disp(['Change in value function:',num2str(diff)]);
    v_init = v_revised;
end

policy = stock(d_revised);

%plotting graphs

figure(1)
plot(stock, v_init(:, 8), 'r-',stock, v_init(:, 11), 'k-.', stock, v_init(:, 14),'b--');
legend({'p = 0.9', 'p = 1', 'p = 1.1'}, 'Location', 'northwest');
title('Value function cross-sections'); 
xlabel('Price');
ylabel('Value');


figure(2)   
plot(grid, policy(250, :), 'r-', grid, policy(500, :), 'k-.', grid, policy(750, :), 'b--');
legend({'stock = 25', 'stock = 50', 'stock = 75'},'Location', 'northwest');
title('Optimal Next-period Stock'); 
xlabel('Price');
ylabel('Optimal Stock Next Period.');