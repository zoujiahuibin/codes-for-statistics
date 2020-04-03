function loglikelihood=loglike_MA(thetas,p,y,muexist)
%aim: estimate the parameters of MA(p)
%model:y_t=mu+epsilon_t+thetas(1)*epsilon_{t-1}+...+thetas(p)*epsilon_{t-p}
%thetas=[psi_1,...,psi_p, sigma^2,mu]
if(muexist)
    y=y-thetas(end);
end
sigma2 = thetas(p+1); 
T = length(y);
Gam = speye(T) ;
for i=1:p
Gam = Gam+ sparse(i+1:T,1:T-i,ones(T-i,1),T,T)*thetas(i);
end
Gam2 = Gam*Gam';
loglikelihood = -T/2*log(2*pi*sigma2)-.5*log(det(Gam2))-.5*y'*(Gam2\y)/sigma2;
end
