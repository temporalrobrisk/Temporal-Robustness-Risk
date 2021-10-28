clc; close all; clear all;

% PARAMS:
sim = 1; % 
N = 10000; % Number of Realizations
params.eps1 = 10; %Precision as to when center is considered
params.eps2 = 15; %Minimum collision avoidance distance
params.constraint_type = 'C';

if sim==1
    %%
    for i=1:N
        % Generate trajectory
        [x, time] = car_traj_generator();

        % Calculate time robustness
        [chi(i), rob(i)] = get_satisfaction(x, params);
        eta(i) = get_eta(x, chi(i), params);
        theta(i) = get_theta(x, chi(i), params);

    %     % Calculate time robustness
    %     [c, h1, h2, h3] = eval_c_cars(x, params);
    %     [chi(i), rob(i)] = get_satisfaction(x, params);
    %     eta(i) = get_eta(x, chi(i), params);
    %     [theta(i),shift] = get_theta(x, chi(i), params);
    %     x_shifted = shift_traj(x, shift);
    %     c = eval_c_cars(x_shifted, params);
    end

    save('181512_v03_m552_dist')
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
    
    figure()
    subplot(1,3,1)
    load('121518_d8_dist')
    histogram(-theta,'Normalization','probability'); hold on
    load('181512_d8_dist')
    histogram(-theta,'Normalization','probability');
    legend('S_1,d=8','S_2,d=8'); xlabel('-\theta^c(X)'); ylabel('pdf(-\theta^c(X))')
    subplot(1,3,2)
    load('121518_d10_dist')
    histogram(-theta,'Normalization','probability'); hold on
    load('181512_d10_dist')
    histogram(-theta,'Normalization','probability');
    legend('S_1,d=10','S_2,d=10'); xlabel('-\theta^c(X)'); ylabel('pdf(-\theta^c(X))')
    subplot(1,3,3)
    load('121518_d12_dist')
    histogram(-theta,'Normalization','probability'); hold on
    load('181512_d12_dist')
    histogram(-theta,'Normalization','probability');
    legend('S_1,d=12','S_2,d=12'); xlabel('-\theta^c(X)'); ylabel('pdf(-\theta^c(X))')
    
    figure()
    load('121518_v03_dist')
    histogram(-theta,'Normalization','probability'); hold on
    load('181512_v03_dist')
    histogram(-theta,'Normalization','probability');
    legend('S_1','S_2'); xlabel('-\theta^c(X)'); ylabel('pdf(-\theta^c(X))')
    
end


