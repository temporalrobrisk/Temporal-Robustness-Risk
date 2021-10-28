    beta = 0.85; 
    delta = 0.01;
    step_size = 0.01; 
    eta_VaR_085 = VaR(-eta,N,beta,delta,step_size);
    %eta_CVaR_085 = CVaR(-eta,N,beta,delta,step_size);
    theta_VaR_085 = VaR(-theta,N,beta,delta,step_size);
    %theta_CVaR_085 = CVaR(-theta,N,beta,delta,step_size);
    
    beta = 0.9; 
    delta = 0.01;
    step_size = 0.01; 
    eta_VaR_09 = VaR(-eta,N,beta,delta,step_size);
    %eta_CVaR_085 = CVaR(-eta,N,beta,delta,step_size);
    theta_VaR_09 = VaR(-theta,N,beta,delta,step_size);
    %theta_CVaR_085 = CVaR(-theta,N,beta,delta,step_size);
    
    beta = 0.95; 
    delta = 0.01;
    step_size = 0.01; 
    eta_VaR_095 = VaR(-eta,N,beta,delta,step_size);
    %eta_CVaR_085 = CVaR(-eta,N,beta,delta,step_size);
    theta_VaR_095 = VaR(-theta,N,beta,delta,step_size);
    %theta_CVaR_085 = CVaR(-theta,N,beta,delta,step_size);
    
    beta = 0.98; 
    delta = 0.01;
    step_size = 0.01; 
    eta_VaR_098 = VaR(-eta,N,beta,delta,step_size);
    %eta_CVaR_085 = CVaR(-eta,N,beta,delta,step_size);
    theta_VaR_098 = VaR(-theta,N,beta,delta,step_size);
    %theta_CVaR_085 = CVaR(-theta,N,beta,delta,step_size);
    
    
    %theta_E=sum(-theta)/N;
    %eta_E=sum(-eta)/N;
    hash=sum(chi==-1);