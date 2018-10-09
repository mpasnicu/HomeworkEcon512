[t , b] = hw3_code([1 0 0 0 0 0]);
tb = table(b');

range = linspace(0, 4, 10);
max = size(range, 2);
T = zeros(4, size(b, 2), max);
B = zeros(max, size(b, 2), 4, 6);


for j = 1 : size(b, 2)
    for k = 1 : max
        beta_zero = zeros(1, 6);
        beta_zero(j) = range(k);
        [t, b] = hw3_code(beta_zero);
        T(:, j, k) = t;
        B(k, j, :, :) = b;
    end
    
end

plot(range, squeeze(T(1, 1, :)), range, squeeze(T(2, 1, :)), range, squeeze(T(3, 1, :)), range, squeeze(T(4, 1, :)));
xlabel('Initial value');
ylabel('Time'); 
legend('MLE', 'MLE QN', 'NLS', 'NLS NM');
