function loglikelihood=loglike_ARMA(thetas,p,q,y,muexist)
%model:
%y_t=mu+phi_1*y_{t-1}+...+phi_p*y_{t-p}+eps_t+psi_1*eps_{t-1}+...+psi_q*eps_{t-q}
%input: thetas is a column vector
%thetas=[phi_1,phi_2,...,phi_p, psi_1,psi_2,...,psi_q, sigma2, mu]

sigma2=thetas(p+q+1);
T=length(y);
%%AR(p)
if(muexist)
    if(length(thetas)~=(p+q+2))
        disp('the input is less!')
        return
    end
  
    X=ones(T-p,1);
    parm1=[thetas(end);thetas(1:p)];
else
    if(length(thetas)~=(p+q+1))
        disp('the input is less!')
        return
    end
    X=[];
    parm1=thetas(1:p);
end
for i=1:p
    X=[X, y(p-i+1:T-i)];
end
yt=y(p+1:end)-X*parm1;


%%MA(q)
T2=T-p;
Gam = speye(T2) ;
for i=1:q
Gam = Gam+ sparse(i+1:T2,1:T2-i,ones(T2-i,1),T2,T2)*thetas(p+i);
end

Gam2 = Gam*Gam';
loglikelihood = -T2/2*log(2*pi*sigma2)-.5*log(det(Gam2))-.5*yt'*(Gam2\yt)/sigma2;
end
