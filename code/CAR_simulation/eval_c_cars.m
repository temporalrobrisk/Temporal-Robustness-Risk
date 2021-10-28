function [c, h1, h2, h3] = eval_c_cars(x, params)

x_green = x(3:4, :);
x_red = x(1:2, :);
x_blue = x(5:6, :);

h1 = params.eps1 - vecnorm(x_green);
h2 = vecnorm(x_green - x_red) - params.eps2;
h3 = vecnorm(x_green - x_blue) - params.eps2;
c = max(-h1, min(h2, h3));


end

