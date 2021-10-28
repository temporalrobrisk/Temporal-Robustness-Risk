function rob_bool = bool_finally(z, t, a, b)
atN = t+a;
btN = t+b;

if btN > size(z, 2)
    error('Oops, error with calling Finally. Value t+I exceeds signal length');
end

rob_bool = bool_or(z(atN:btN));
end