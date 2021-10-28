function plot_cars(x)
figure
hold on

p1 = plot(x(1,:),x(2,:),'r', 'linewidth', 2); 
p2 = plot(x(3,:),x(4,:),'g', 'linewidth', 2); 
p3 = plot(x(5,:),x(6,:),'b', 'linewidth', 2);   
legend([p1, p2, p3], {'Car 1', 'Car 2', 'Car 3'}, 'AutoUpdate', 'off', 'Location','northeast', 'FontSize',15); 


% PLOT THE LANES
yline(-10, 'k'); % horizontal bottom shoulder
plot([-300, -10], [10, 10], 'k'); % horizontal upper shoulder left
plot([10, 300],   [10, 10], 'k'); % horizontal upper shoulder right

plot([-10, -10], [10, 300], 'k'); % vertical shoulder left
plot([10, 10],   [10, 300], 'k'); % vertical shoulder right

plot([0, 0], [10, 300], 'k--'); % horizontal lane divider
yline(0, 'k--');
end