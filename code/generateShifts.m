function shifts = generateShifts(max_val, d)
dd=d-1;
P = unique(nchoosek(repmat(-max_val:max_val, 1, dd), dd), 'rows');
PP = sortrows(P);

S = [];
for max_val_ind = 1:d    
    for direction = [-1, 1]
        SS = zeros(size(PP, 1), d);
        
        SS(:, max_val_ind) = direction*max_val;
        SS(:, 1:end ~= max_val_ind) = PP;
        S = [S; SS];
    end
end
shifts = unique(S, 'rows');
end