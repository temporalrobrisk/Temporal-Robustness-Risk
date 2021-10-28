function main_example()

clc; close all; clear all;

% PARAMS:
params.eps = 1; %Precision as to when center is considered
params.T = 12;
params.constraint_type = 'Example';

t=0:1:200;
index = find(t>=130 & t<=170);
params.t=t;

alpha_k = 1./25;
x1=sin(alpha_k*pi.*t);
x2=-1.05*sin(3/2*alpha_k*pi.*t);
x=[x1;x2];


figure()
subplot(1,3,1)
hold on;
plot_all_together(index, t, x1, x2, params)
legend('$$x_1(t)$$','$$x_2(t)$$','$$h(x(t))$$','Location','southeast','Interpreter','latex', 'FontSize',12); 


chi = get_satisfaction(x, params);
[eta,shift_eta] = get_eta(x, chi, params);
[theta,shift_theta] = get_theta(x, chi, params);


x_shifted = shift_traj(x, shift_eta);
x1=x_shifted(1,:);
x2=x_shifted(2,:);
subplot(1,3,2)
hold on;
plot_all_together(index, t, x1, x2, params);
legend('$$x_1(t-13)$$','$$x_2(t-13)$$','$$h(x(t))$$','Location','southeast','Interpreter','latex', 'FontSize',12); 


x_shifted = shift_traj(x, shift_theta);
x1=x_shifted(1,:);
x2=x_shifted(2,:);
subplot(1,3,3)
hold on;
plot_all_together(index, t, x1, x2, params);
legend('$$x_1(t-4)$$','$$x_2(t+3)$$','$$h(x(t))$$','Location','southeast','Interpreter','latex', 'FontSize',12); 


set(gca, 'box', 'off')

% set(gcf, 'PaperType', 'uslegal', 'PaperOrientation', 'Landscape');
% set(gcf,'Position',[-1.48 2.22, 16.96, 5]);
% print(gcf,'ex_agents', '-bestfit', '-dpdf') % then print it
end

%%
function plot_all_together(index, t, x1, x2, params)
plot_rectangle(params); 
plot(t(index),x1(index),'Color','red','LineWidth',0.75,'Marker','.','MarkerSize',12); 
plot(t(index),x2(index),'Color','blue','LineWidth',0.75,'Marker','.','MarkerSize',12); 

h = params.eps-abs(x1(index)-x2(index));
plot(t(index),h,'Color','black','LineWidth',0.75,'Marker','.','MarkerSize',12);

plot_dotted_lines(params);
xlim([139,161]);
ylim([-1.1, 1.1]);
end

%%
function plot_dotted_lines(params)
% line(20*[7,7],[0,params.eps+0.1],'Color','black','LineStyle','--');
% line(20*[9,9],[0,params.eps+0.1],'Color','black','LineStyle','--');
%line(20*[6,10],[params.eps,params.eps],'Color','black','LineStyle','--'); 
line([145, 145],[0-0.1,1.5],'Color','black','LineStyle','--');
line([155, 155],[0-0.1,1.5],'Color','black','LineStyle','--');
line(20*[6,10],[0,0],'Color','black','LineStyle','--');
end

%%
function plot_rectangle(params)
alpha = 0.1;
%color_blue = [51./255, 102./255, 1 alpha];
color_green = [.0 .875 .0 alpha];

%rectangle('Position',[140,0,40,params.eps],'FaceColor', color_green);
rectangle('Position',[145,0,10,1.5],'FaceColor', color_green,'EdgeColor', color_green);
end