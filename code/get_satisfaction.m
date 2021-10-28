function [chi, varargout] = get_satisfaction(x, params)

switch params.constraint_type
    %----------------------------------------------------------------------
    case 'STL'
        chi = eval_phi_robots(x, params);
    %----------------------------------------------------------------------
    case 'C'
        c = eval_c_cars(x, params);     
        rob = min(c);
        
        varargout{1} = rob;
        chi = 2*(rob >= 0)-1; % {-1, +1} value   
    case 'Example'
        c = eval_c_example(x, params);     
        rob = min(c);
        
        varargout{1} = rob;
        chi = 2*(rob >= 0)-1; % {-1, +1} value    
end
end