function risk = VaR(rob,N,beta,delta,step_size)

alpha  = max(rob);
margin = sqrt(log(2/delta)/2/N);
if 1-margin< beta
    error('Infeasible, decrease beta and/or delta and/or increase N')
end
while 1
    ind = find(round(rob)<=alpha);
    emp_F = sum(ind./ind)/N;
    if emp_F-margin< beta
        risk=alpha+step_size;
        break;
    end
    alpha=alpha-step_size;
end
