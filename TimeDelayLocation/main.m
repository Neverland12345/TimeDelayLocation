%主程序
filename='RigolDS2.csv';
data=find_data(filename);
time=find_time(data);
result=location([174,-4,110],300,500,0.3,20,0.6,0.5,1,50,20,time,"line",30)

%F=@(x) [((x(1)-240)^2+(x(2)+size)^2+(x(3)-5)^2)^0.5-((x(1)-240)^2+x(2)^2+(x(3)-5)^2)^0.5-340000*(time(1)-time(2));
%        ((x(1)-240)^2+x(2)^2+(x(3)-5)^2)^0.5-((x(1)-240)^2+(x(2)-size)^2+(x(3)-5)^2)^0.5-340000*(time(2)-time(3));
%        ((x(1)-240)^2+(x(2)+size)^2+(x(3)-5)^2)^0.5-((x(1)-240)^2+(x(2)-size)^2+(x(3)-5)^2)^0.5-340000*(time(1)-time(3));];
%options=optimset('Display','iter');
%[X,FVAL,EXITFLAG,OUTPUT,JACOB]=fsolve(F,[76,17,85],options)