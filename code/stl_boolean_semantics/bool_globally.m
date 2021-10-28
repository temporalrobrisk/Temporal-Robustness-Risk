function rob_bool = bool_globally(z, t, a, b)
atN = t+a;
btN = t+b;

if btN > size(z, 2)
    error('Oops, error with calling Globally. Value t+I exceeds signal length');
end

rob_bool = bool_and(z(atN:btN));
end