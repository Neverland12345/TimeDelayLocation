filename='RigolDS11.csv';
data=find_data(filename);
x1=data(:,1);
x2=data(:,2);

%X1=fft(x1);                 
%X2=fft(x2);
%Pxx=X1.*conj(X1);
%Pyy=X2.*conj(X2);
%Pxy=X1.*conj(X2); 

Pxy=cpsd(x1,x2);
R0=real(ifft(Pxy));
R0=fftshift(R0);
plot(R0)
title("互相关函数"),xlabel("采样点"),ylabel("幅值")
c0=max(R0);
a0=find(R0==c0);

Rl2=fix(length(R0)/2);
delay=(a0-(Rl2)-1)*(2e-6)*340000
