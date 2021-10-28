function [eta, shift] = get_eta(x, chi, params)

N = length(x);

for ii = 1:N
    for direction = [-1, 1]
        shift = direction * ii;
        x_shifted = shift_traj(x, shift); 
        
        chi_shifted = get_satisfaction(x_shifted, params);

        if chi_shifted ~= chi
            eta = chi * (ii-1);
            %fprintf('Eta = %d,\tShift_change = %d\n', eta, shift);
            return
        end
    end
end

%warning('End of trajectory is reached, assign eta to traj length');

%eta = inf;
%shift = nan;
eta = chi*N;
shift = N;
%fprintf('Eta = %d,\tShift_change = %d\n', eta, shift);
end

