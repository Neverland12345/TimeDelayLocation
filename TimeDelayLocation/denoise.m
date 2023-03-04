%降噪
filename='RigolDS1.csv';
data=find_data(filename);
data=data(:,1);
[C,L]=wavedec(data,4,'db5');
cd1=detcoef(C,L,1);
cd2=detcoef(C,L,2);
cd3=detcoef(C,L,3);
cd4=detcoef(C,L,4);
th1=thselect(cd1,'heursure');
th2=thselect(cd2,'heursure');
th3=thselect(cd3,'heursure');
th4=thselect(cd4,'heursure');
TH=[th1,th2,th3,th4];
[XC,CXC,LXC,PERF0_1,PERF2_1]=wdencmp('lvd',data,'db5',4,TH,'s');
subplot(2,1,1);plot(data)
subplot(2,1,2);plot(XC)

