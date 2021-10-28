function c = eval_c_example(x, params)

t = params.t;
c = 5000*ones(1,length(t));
index = find(t>=145 & t<=155);
c(index) = params.eps - abs(x(1,index)-x(2,index));
end

