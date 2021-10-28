function animate_cars(x)
plot_cars(x);
hold on

circle(0,0,10) 

N = size(x, 2);
speed = 1; % speeds up x times
for t = 1:speed:N
    if exist('plot_vehicle_green', 'var')
        delete(plot_vehicle_green);
        delete(plot_vehicle_red);
        delete(plot_vehicle_blue);
        delete(plot_circle_green);
    end
    plot_vehicle_green = scatter(x(3,t), x(4,t), 200, 'filled', 'p', 'MarkerFaceColor', 'g');
    plot_vehicle_red = scatter(x(1,t), x(2,t), 200, 'filled', 'p', 'MarkerFaceColor', 'r');
    plot_vehicle_blue = scatter(x(5,t), x(6,t), 200, 'filled', 'p', 'MarkerFaceColor', 'b');
    plot_circle_green = circle(x(3,t),x(4,t),15);
    pause(0.005);
end
end