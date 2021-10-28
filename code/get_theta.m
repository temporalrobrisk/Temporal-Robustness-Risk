function [theta, shift] = get_theta(x, chi, params)

N = size(x, 2);
x_dim = size(x, 1);

if rem(x_dim, 2) ~= 0
    error('X should have even number of coordinates');
end

switch x_dim
    %---------------------
    % CAR CASE STUDY
    case 6 
        N_couples = 3;
    %---------------------
    % DRONE CASE STUDY
    case 8 
        N_couples = 2;
    %---------------------
    % Running Example
    case 2 
        N_couples = 2;
end

for ii = 1:N
    shifts = generateShifts(ii, N_couples);
    for idx = 1:size(shifts, 1)
        shift = shifts(idx, :);
        x_shifted = shift_traj(x, shift); 
      
        chi_shifted = get_satisfaction(x_shifted, params);

        if chi_shifted ~= chi
            theta = chi * (ii-1);
            %fprintf(['Theta = %d,\t Shift_change = ' repmat('%d, ',1, N_couples) '\n'], theta, shift);
            return
        end
    end
end

%warning('End of trajectory is reached, assign theta to traj length');
%theta = inf;
theta = chi*N;
shift = N*ones(1, N_couples);
%fprintf(['Theta = %d,\t Shift_change = ' repmat('%d, ',1, N_couples) '\n'], theta, shift);
end

