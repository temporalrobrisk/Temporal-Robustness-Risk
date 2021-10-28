clc; clear all; close all

N = 10000;
sim = 1;

data = load('robots_controller.mat');
data.constraint_type = 'STL';

if sim==1
    for i=1:N
        %% Create trajectory
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        x = robot_traj_generator(data);
        
        shift_traj = 10;
        x = [x(:, (shift_traj+1):end), repmat(x(:, end), 1, shift_traj)];
        %% GRAPHICS
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        flag_plot = 0;
        if flag_plot
            %plot_robots(x, data);
            animate_robots(x, data);
        end

        %% TIME ROBUSTNESS
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        chi(i) = get_satisfaction(x, data);
        eta(i) = get_eta(x, chi(i), data);
        theta(i) = get_theta(x, chi(i), data);
    end
    save('d_7_7_dist')
    %save('t0_8_dist')
else 
    load('181512_d10_dist')
    
    % Calculate time robustness risk
    beta = 0.95; 
    delta = 0.01;
    step_size = 0.01; 
    VaR_eta = VaR(-eta,N,beta,delta,step_size);
    CVaR_eta = CVaR(-eta,N,beta,delta,step_size);
    VaR_theta = VaR(-theta,N,beta,delta,step_size);
    CVaR_theta = CVaR(-theta,N,beta,delta,step_size);
    E=sum(-theta)/N;
    
    
end

