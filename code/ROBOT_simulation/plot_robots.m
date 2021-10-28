function plot_robots(x, params)

color_red = [200./255, 0, 0];
color_blue = [51./255, 102./255, 1];
color_green = [.0 .875 .0];
color_orange = [1 102./255 0];

figure
hold on

p1 = plot(x(1, :), x(3, :), '.-', 'color', color_blue, 'linewidth', 3);
%scatter(x(1, 1), x(3, 1), 500, 'filled', 'p', 'MarkerFaceColor', color_blue);

p2 = plot(x(5, :), x(7, :), '.-', 'color', color_orange, 'linewidth', 3);
%scatter(x(5, 1), x(7, 1), 500, 'filled', 'p', 'MarkerFaceColor', color_orange);

hA = fill_between([params.coords_goal_A.x_lb,params.coords_goal_A.x_ub],...
                    params.coords_goal_A.y_lb*ones(1,2), ...
                    params.coords_goal_A.y_ub*ones(1,2));
hA.FaceColor = color_green;
alpha(hA, .2);

hB = fill_between([params.coords_goal_B.x_lb,params.coords_goal_B.x_ub],...
                    params.coords_goal_B.y_lb*ones(1,2), ...
                    params.coords_goal_B.y_ub*ones(1,2));
hB.FaceColor = color_green;
alpha(hB, .2);

h_ch = fill_between([params.coords_ch.x_lb, params.coords_ch.x_ub], ...
                     params.coords_ch.y_lb*ones(1,2), ...
                     params.coords_ch.y_ub*ones(1,2));
h_ch.FaceColor = 'y';
alpha(h_ch, .6);

%leg = legend([p1, p2], {'Robot_1(t+6)', 'Robot_2(t-7)'}, 'AutoUpdate', 'off', 'Location','northeast', 'FontSize',19, 'Interpreter','tex'); 
leg = legend([p1, p2], {'Robot_1', 'Robot_2'}, 'AutoUpdate', 'off', 'Location','northeast', 'FontSize',19, 'Interpreter','tex'); 

set(leg,'Box','off');
axis equal;
xlabel('X', 'fontsize', 12);
ylabel('Y', 'fontsize', 12);
ylh = get(gca,'ylabel');
set(ylh, 'Rotation',0);

xlim([3,18]);
% ylim([3.5,13]);
ylim([4.4,12.5]);
yticks(4:2:12);
text(6.8, 5.5,'A', 'fontsize', 15);
text(15.8, 5.5,'B', 'fontsize', 15);
text(9,10.5,'Charge', 'fontsize', 15);
% text(9,12.5,'\alpha_1', 'fontsize', 15);
% text(6,4.3,'\alpha_2', 'fontsize', 15);

% set(gcf, 'PaperType', 'uslegal', 'PaperOrientation', 'Landscape');
% set(gcf,'Position',[-1.48 2.22, 16.96, 5]);
% print(gcf,'ex_agents', '-bestfit', '-dpdf') % then print it
