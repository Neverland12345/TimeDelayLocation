%使用小波函数'db6'对信号进行3层分解

filename='RigolDS1.csv';
data=find_data(filename);
y1=filter(Num,1,data(:,1));
nx=y1;
[c,l] = wavedec(nx,3,'db6');

%估计尺度1的噪声标准差

sigma = wnoisest(c,l,1);

alpha = 2;

%获取消噪过程中的阈值

thr = wbmpen(c,l,sigma,alpha);

keepapp = 1;

%对信号进行消噪

xd = wdencmp('gbl',c,l,'db6',3,thr,'s',keepapp);

subplot(221);



title('原始信号');

subplot(222);

plot(nx);

title('含噪信号');

subplot(223);

plot(xd);

title('消噪后的信号');