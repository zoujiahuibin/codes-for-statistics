function [phihat,sigma2hat]=estimate_IAR(I,p,y,muexist)
%aim: estimating the parameter of IAR(I,p) model
%muexist=TRUE 表示期望不为零
%p为AR(p)中的参数
%AR(p)模型的参数估计和最小线性估计的一样
%phihat=[mu, phi1,phi2], 如果mu不为零时
%sigma2hat时方差的估计
%I表示差分次数
y=diff(y,I);
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