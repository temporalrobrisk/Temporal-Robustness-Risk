function chi = eval_phi_robots(x, params)

pos_1 = [x(1, :); x(3, :)];
pos_2 = [x(5, :); x(7, :)];

%% Basic
pos1_A = bool_mu_goal(pos_1, params.coords_goal_A);
pos2_A = bool_mu_goal(pos_2, params.coords_goal_A);

pos1_B = bool_mu_goal(pos_1, params.coords_goal_B);
pos2_B = bool_mu_goal(pos_2, params.coords_goal_B);

pos1_ch = bool_mu_goal(pos_1, params.coords_ch);
pos2_ch = bool_mu_goal(pos_2, params.coords_ch);

%% Ch1 & Ch2
b_ch = 5;
b_life = 20;

for t = 1:(b_life+1)
    ch1_g(t) = bool_globally(pos1_ch, t, 0, b_ch);
    ch2_g(t) = bool_globally(pos2_ch, t, 0, b_ch);
end

ch1 = bool_finally(ch1_g, 1, 0, b_life); 
ch2 = bool_finally(ch2_g, 1, 0, b_life);

%% Goal B

goal_B_and = bool_and([pos1_B; pos2_B]);
goal_B = bool_finally(goal_B_and, 1, 10, 60); 

%% Goal A
goal_A_or = bool_or([pos1_A; pos2_A]);

b_out = 10;
a_in = 10;
b_in = 50;

for t = 1:(b_out+1)
    goal_A_finally(t) = bool_finally(goal_A_or, t, a_in, b_in);
    goal_A_and(t) = bool_and([goal_A_or(t); goal_A_finally(t)]);
end

goal_A = bool_finally(goal_A_and, 1, 0, b_out);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

chi_bool = bool_and([ch1; ch2; goal_B; goal_A]);
chi = 2*chi_bool - 1; % {-1, +1} value
end

