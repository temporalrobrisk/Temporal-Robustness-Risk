function x_shifted = shift_traj(x, shift)
shift = shift(:); % should be a column

dim_x = size(x, 1);
dim_shift = size(shift, 1);

if dim_shift == 1
    x_shifted = shift_sync_traj(x, shift);
else
    x_shifted = shift_asyn_traj(x, shift);
end
end

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function x_shifted = shift_sync_traj(x, shift)

N = length(x);
kappa = abs(shift);

if shift >= 0
    % shift to the left
    x_shifted  = [x(:, 1+kappa:N), repmat(x(:, N), 1, kappa)]; 
else
    % shift to the right
    x_shifted = [repmat(x(:, 1), 1, kappa) x(:, 1:N-kappa)];    
end
end

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function x_shifted = shift_asyn_traj(x, shift_array)
dim_x = size(x, 1);
N = size(x, 2);

N_couples = length(shift_array);
couple_len =  dim_x/N_couples;

x_shifted = 0*x;
for ii = 1:size(shift_array, 1)
    shift = shift_array(ii);
    kappa = abs(shift);

    % CAR CASE STUDY: couple two coordinates together (12; 34; 56).
    %                 [2*ii-1, 2*ii]
    % DRONE CASE STUDY: couple four coordinates together (1234; 5678)
    %                 [4*ii-3, 4*ii-2, 4*ii-1, 4*ii]
    coord = couple_len*ii*ones(1, couple_len) + ((-couple_len+1):0);
    
    if shift >= 0
        % shift to the left
        x_shifted(coord, :)  = [x(coord, 1+kappa:N), repmat(x(coord, N), 1, kappa)]; 
    else
        % shift to the right
        x_shifted(coord, :) = [repmat(x(coord, 1), 1, kappa) x(coord, 1:N-kappa)];    
    end
end
end

