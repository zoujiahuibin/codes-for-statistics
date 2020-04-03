function [phihat,sigma2hat]=estimate_IAR(I,p,y,muexist)
%aim: estimating the parameter of IAR(I,p) model
%muexist=TRUE ��ʾ������Ϊ��
%pΪAR(p)�еĲ���
%AR(p)ģ�͵Ĳ������ƺ���С���Թ��Ƶ�һ��
%phihat=[mu, phi1,phi2], ���mu��Ϊ��ʱ
%sigma2hatʱ����Ĺ���
%I��ʾ��ִ���
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