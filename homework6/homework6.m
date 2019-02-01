%% Question 2
% all looks good, check plus
[prob, grid] = tauchen(21, 0.5, 0.5, 0.1); 


%% Question 3 + 4

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
    Ev = v_init * pi';
    
    for j = 1 : S
        U = utility(P, stock(j) - S_1);
        [v_revised(j, :), d_revised(j, :)] = max(U + delta * Ev);
    end
    
    diff = norm(v_revised - v_init)/norm(v_revised);
    disp(['Change in value function:', num2str(diff)]);
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
ylabel('Optimal Stock Next Period');


%% Question 5

%setting parameters
rng(1000); 
sims = 50; 
decision_sim = zeros(sims, 20);
p_gen = zeros(sims, 20); 


for i = 1 : sims

    p_gen(i, 1) = 11; 
    
    for j = 1 : 19
        draw = mnrnd(1, prob(p_gen(i, j), :));
        p_gen(i, j + 1) = find(draw == 1);
    end
    
    decision_sim(i, 1) = d_revised(1000, 11);
    
    for j = 1 : 19
        decision_sim(i, j + 1) = d_revised(decision_sim(i, j), p_gen(i, j+1));
    end
    
    disp(['Iteration:', num2str(i)]);
end
sim_stock = stock(decision_sim);
sim_stock_mean = mean(sim_stock, 1);
sim_stock_se = std(sim_stock, 1);
sim_stock_lb = sim_stock_mean - 1.645 * sim_stock_se/sqrt(sims);
sim_stock_ub = sim_stock_mean + 1.645 * sim_stock_se/sqrt(sims);

%plotting the result
figure(3)
plot(1 : 1 : 20, sim_stock_mean, 1:1:20, sim_stock_lb, 1:1:20, sim_stock_ub);
legend({'Mean Stock', 'Lower', 'Upper'}, 'Location', 'northwest');
title('Expected Optimal Next-period Stock'); 
xlabel('Time');
ylabel('Expected Optimal Stock Next Period');



%% Question 6

%use the same code with change to number of points
%note, we didn't need to change the names of the variables, but we did so
%for tractability

[prob_1, grid_1] = tauchen(5, 0.5, 0.5, 0.1);
delta = 0.95; 
S = 1000; 
P = repmat(grid_1, S,1); 
pi_1 = prob_1;
                                                
stock_1 = linspace(0,100,S); 
S_1 = repmat(stock_1', 1, length(grid_1));
v_init_1 = zeros(S, length(grid_1));
d_init_1 = ones(S, length(grid_1)); 
v_revised_1 = ones(S, length(grid_1));
d_revised_1 = ones(S, length(grid_1));
diff_1 = 1;

% actual vfi
while diff_1 > 0.001
    Ev = v_init_1 * pi_1';
    
    for i = 1 : S
        U = utility(P, stock(i) - S_1);
        [v_revised_1(i, :), d_revised_1(i, :)] = max(U + delta * Ev);
    end
    
    diff_1 = norm(v_revised_1 - v_init_1)/norm(v_revised_1);
    disp(['Change in value function:', num2str(diff_1)]);
    v_init_1 = v_revised_1;
end

policy_1 = stock_1(d_revised_1);

%plotting graphs

figure(4)
plot(stock_1, v_init_1(:, 2), 'r-', stock_1, v_init_1(:, 3), 'k-.', stock_1, v_init_1(:, 4), 'b--');
legend({'p = 0.9', 'p = 1', 'p = 1.1'}, 'Location', 'northwest');
title('Value function cross-sections');
xlabel('Price');
ylabel('Value');


figure(5)
plot(grid_1, policy_1(250, :), 'r-', grid_1, policy_1(500, :), 'k-.', grid_1, policy_1(750, :), 'b--');
legend({'stock = 25','stock = 50','stock = 75'},'Location','northwest');
title('Optimal Next-period Stock');
xlabel('Price');
ylabel('Optimal Stock Next Period');


