function [x, time] = car_traj_generator()

ts = 0.1; % Sampling time
T = 30; % Simulation time
time = 0:ts:T;

v1=18+0.3*randn; %Velocity car 1 (red)
v2=15+0.3*randn; %Velocity car 2 (green)
v3=12+0.3*randn; %Velocity car 3 (blue)

t0 = 5; % initial time (allows delay forward and backward in time)
d1=t0-ts*5;%unifrnd(-ts*0,ts*0); %Delay car 1 (red)
d2=t0+ts*5;%unifrnd(-ts*0,ts*0); %Delay car 2 (green)
d3=t0+ts*2;%unifrnd(-ts*0,ts*0); %Delay car 3 (blue)

x(:,1) = [300;5;-5;300;-300;-5]; % Initial positions

% Run simulation loop
controller=1;
for ii = 1:length(time)-1
    t = time(ii);
    
    % Dynamics (Taking delays into account)
    f = zeros(6,6);
    if t>=d1
       f = f+blkdiag(eye(2),zeros(2,2),zeros(2,2)); 
    end
    if t>=d2
       f = f+blkdiag(zeros(2,2),eye(2),zeros(2,2)); 
    end
    if t>=d3
       f = f+blkdiag(zeros(2,2),zeros(2,2),eye(2)); 
    end
    
    % Define controller
    %if controller==2 || norm(x(3:4,ii)-[-5;-2])<=0.25 %Controller after turn
    if controller==2 || x(4,ii)<=-1.75 %Controller after turn
        controller = 2;
        u = [-v1; 0; v2; 0; v3; 0];
    else                                                   %Controller before turn
        u = [-v1; 0; 0; -v2; v3; 0];
    end
    
    % Propagate dynamics
    x(:,ii+1) = x(:,ii) + ts*f*u;
end