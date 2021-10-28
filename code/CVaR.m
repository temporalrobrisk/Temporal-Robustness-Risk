function risk = CVaR(rob,N,beta,delta,step_size)


margin = sqrt(11*log(6/delta)/(N*(1-beta)))*(max(rob)-min(rob));
counter = 1;
for alpha=max(rob):-step_size:min(rob) % Slow and hacky
    CVaR_est(counter) = alpha+sum(max(rob-alpha,0))/(N*(1-beta));
    counter = counter + 1;
end

alpha=max(rob):-step_size:min(rob);
[~,ind]=min(CVaR_est);
CVaR_hat=alpha(ind)+sum(max(rob-alpha(ind),0))/(N*(1-beta));

risk = CVaR_hat;% + margin;