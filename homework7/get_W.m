function [W_0, W_1, W_2] = get_W(old_V)

% simple function that computes W

global  t_0 t_1;

W_0 = t_0 * old_V * t_0';          
W_1 = t_1 * old_V * t_0';          
W_2 = t_0 * old_V * t_1';          
 
end