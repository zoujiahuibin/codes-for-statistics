function Bhat=estimate_VAR(Y,p)
%aim: esitmate the parameters of VAR(p)
%input: Y=[y1, y2, y3]
%model: Y_t=b+B_1*Y_{t-1}+...+B_p*Y_{t-p}+epsilon
%output: Bhat=[b,B_1,...,B_p]

T=size(Y,1);
D=size(Y,2);

X=[];
for t=T:-1:(p+1)
    Xtemp=1;
    for lag=1:p
        for i=1:D
            Xtemp=[Xtemp; Y(t-lag,i)];%,i); Y(t-1); y1(t-2); y2(t-2); y3(t-2)];
        end
    end
   X=[X, Xtemp];
end
Yt=Y(T:-1:(p+1),:)';
Bhat=Yt*X'/(X*X');
end
