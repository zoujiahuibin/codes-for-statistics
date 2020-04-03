function [phihat,sigma2hat]=estimate_AR(p,y,muexist)
%auther: zoujiahui
%data: 2019-11-1
%aim: estimating the parameter of AR(p) model
%muexist=TRUE means the expectation of y is not zeors
%p is the parameter in AR(p)
%the method of estimation for AR(p) is OLS
%phihat=[mu, phi1,phi2] if muexist=TRUE and  phihat=[phi1,phi2] otherwise
%sigma2hat is the estimator of variance of epsilon

T = length(y);
if(muexist)
    X=ones(T-p,1);
else
    X=[];
end
for i=1:p
    X=[X, y(p-i+1:T-i)];
end
yy=y(p+1:T);
phihat=(X'*X)\X'*yy;
sigma2hat=(yy-X*phihat)'*(yy-X*phihat)/length(yy);