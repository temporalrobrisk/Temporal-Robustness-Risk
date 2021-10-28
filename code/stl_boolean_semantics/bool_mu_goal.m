function rob_bool = bool_mu_goal(pos, goal)

z_x1 = bool_mu(pos(1, :), 1, goal.x_lb);
z_x2 = bool_mu(pos(1, :), -1, -goal.x_ub);
z_y1 = bool_mu(pos(2, :), 1, goal.y_lb);
z_y2 = bool_mu(pos(2, :), -1, -goal.y_ub);
z = [z_x1; z_x2; z_y1; z_y2];

rob_bool = bool_and(z);
end

