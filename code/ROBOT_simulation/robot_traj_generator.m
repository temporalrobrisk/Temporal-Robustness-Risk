function x = robot_traj_generator(data)


u = data.U;
x01 = data.x01;
x02 = data.x02;
Ts = data.Ts;
A_ = data.A;
B_ = data.B;

t0 =0+poissrnd(0); % initial time step
d1=t0+poissrnd(7); %Delay in time steps robot 1
d2=t0+poissrnd(7); %Delay in time steps robot 2

%% Simulate system
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = [x01, x02];
N = length(u);
for k = 1:N
    % Dynamics (Taking delays into account)
    if k>d1
       A = A_(1:4,1:4); 
       B = B_(1:4,1:2);
       u_k = u(k-d1,1:2)';
       x_k = x(end,1:4)';
       x_kp1(1:4) = A*x_k + B*u_k;
    else
       x_kp1(1:4) = x(end,1:4);
    end
    
    if k>d2
       A = A_(5:8,5:8); 
       B = B_(5:8,3:4);
       u_k = u(k-d2,3:4)';
       x_k = x(end,5:8)';
       x_kp1(5:8) = A*x_k + B*u_k;
    else
       x_kp1(5:8) = x(end,5:8);
    end
    
%     A = zeros(8,8);
%     B = zeros(8,4); 
%     u_k = zeros(1,4);
%     if k>d1
%        A = A+blkdiag(A_(1:4,1:4),eye(4)); 
%        B = B+blkdiag(B_(1:4,1:2),zeros(4,2));
%        u_k(1:2) = u(k-d1,1:2);
%     end
%     if k>d2
%        A = A+blkdiag(eye(4),A_(5:8,5:8)); 
%        B = B+blkdiag(zeros(4,2),B_(5:8,3:4));
%        u_k(3:4) = u(k-d2,3:4);
%     end
%     u_k = u_k';
%     x_k = x(end, :)';
% 
%     x_kp1 = A*x_k + B*u_k;
    x = [x; x_kp1];
end
x = x';

        
