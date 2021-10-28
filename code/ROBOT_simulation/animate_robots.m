function animate_robots(x, params)
plot_robots(x, params);
hold on

color_red = [200./255, 0, 0];
color_blue = [51./255, 102./255, 1];
color_green = [.0 .875 .0];
color_orange = [1 102./255 0];

N = length(x);
speed = 1; % speeds up x times
for t = 1:speed:N
    if exist('plot_1', 'var')
        delete(plot_1);
        delete(plot_2);
    end
    plot_1 = scatter(x(1, t), x(3, t), 500, 'filled', 'p', 'MarkerFaceColor', color_blue);
    plot_2 = scatter(x(5, t), x(7, t), 500, 'filled', 'p', 'MarkerFaceColor', color_orange);
    pause(0.2);
end
end