function draw_trajs(T1, T2, t, x, c, color)
    subplot(3, 1, 1);
    hold on
    plot(t, x, color, 'linewidth', 2);
    xline(T1, 'k--', 'T1');
    xline(T2, 'k--', 'T2');
    title('Trajectory');
    %
    subplot(3, 1, 2);
    hold on
    plot(t, c, color, 'linewidth', 2);
    yline(0, 'k--', '0');
    xline(T1, 'k--', 'T1');
    xline(T2, 'k--', 'T2');
    ylim([min(x), max(x)]);
    title('Constraint Function');
end
