%寻参
%时延提取
function time=find_time_test(data)
    x1=data(:,1);
    x2=data(:,2);
    x3=data(:,3);
X1=fft(x1);                 
X2=fft(x2);
X3=fft(x3);
%Pxy1=X1.*conj(X2);
%Pxy2=X2.*conj(X3);
%Pxy3=X1.*conj(X3); 
    Pxy1=cpsd(x1,x2);
    Pxy2=cpsd(x1,x3);
    Pxy3=cpsd(x2,x3);  %探头顺序
    
    R1=abs(ifft(Pxy1));
    R1=fftshift(R1);
    c1=max(R1);
    a1=find(R1==c1);
    Rl1=fix(length(R1)/2);
    delay1=(a1-(Rl1)-1);
   
    R2=abs(ifft(Pxy2));
    R2=fftshift(R2);
    c2=max(R2);
    a2=find(R2==c2);
    Rl2=fix(length(R2)/2);
    delay2=(a2-(Rl2)-1);
    
    R3=abs(ifft(Pxy3));
    R3=fftshift(R3);
    c3=max(R3);
    a3=find(R3==c3);
    Rl3=fix(length(R3)/2);
    delay3=(a3-(Rl3)-1);
    time=[delay1,delay2,delay3];
    
    
    %noise=data(1:1500,:);
    %max_noise=[max(noise(:,1)),max(noise(:,2)),max(noise(:,3))];
    %t=[0,0,0];
    %for i=1:3
        %n=zeros(length(data),1)+max_noise(i);
        %a=data(:,i)-n;
        %b=find(a>0);
        %t(i)=b(1);
    %end
    %time=t*(5e-6);
    
end
        
        
        
    
    