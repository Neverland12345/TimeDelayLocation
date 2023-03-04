data=find_data('RigolDS2.csv');
Ts=2e-6;
subplot(3,1,1),plot(data(:,1));
title("传感器1"),xlabel("采样点"),ylabel("幅值");
subplot(3,1,2),plot(data(:,2));
title("传感器2"),xlabel("采样点"),ylabel("幅值");
subplot(3,1,3),plot(data(:,3));
title("传感器3"),xlabel("采样点"),ylabel("幅值");
data1=data(1:1800,1);
a=mean(data1)
b=var(data1)

%subplot(1,3,2),plot(data(:,2));
%subplot(1,3,3),plot(data(:,3));
y1=filter(Num,1,data(:,2));
fs=1/Ts;
y=fft(y1);
n = length(data(:,2));          % number of samples
P2 = abs(y/n);
P1 = P2(1:n/2+1);
P1(2:end-1) = 2*P1(2:end-1);    % frequency range
f = fs*(0:(n/2))/n;
subplot(1,3,2),plot(f,P1)
%subplot(1,3,2),plot(f,P1)
%subplot(1,3,3);
%CWTcoeffs=cwt(data(:,1),1:50,'db10','plot');
colormap jet;
colorbar
