function plot_constraints(time, c, h1, h2, h3)

figure()
%
subplot(3, 1, 1);
hold on
plot(time, -h1, 'g', 'linewidth', 2);
plot(time, h2, 'm', 'linewidth', 2);
plot(time, h3, 'k', 'linewidth', 2); 
yline(0, 'k--');
legend('-h1','h2','h3', '0');

%
subplot(3, 1, 2);
hold on
plot(time, -h1, 'g', 'linewidth', 2);
plot(time, min(h2,h3), 'r', 'linewidth', 2);
yline(0, 'k--');
legend('-h1','min(h2,h3)', '0');

%
subplot(3, 1, 3);
hold on
plot(time, c, 'b', 'linewidth', 2);
yline(0, 'k--');
legend('c=max(-h1, min(h2, h3))');
end