function y=location(Y,n,c,s,l0,p,r,b,R0,R,time,type,size)
    function f1=f1(x,y,z,type,size)
        if type=="line"
            f1=abs(((x-250)^2+(y+size)^2+(z-size-7-15.5)^2)^0.5-((x-250)^2+y^2+(z-size-7-15.5)^2)^0.5)-abs(340000*(time(1)));
        else
            f1=((x-250)^2+y^2+(z-5.5-38-15.5)^2)^0.5-((x-250)^2+(y+size/2)^2+(z-5.5-2-15.5)^2)^0.5-340000*(time(1));
        end
    end
    
    function f2=f2(x,y,z,type,size)
        if type=="line"
            f2=abs(((x-250)^2+(y)^2+(z-size-7-15.5)^2)^0.5-((x-250)^2+(y-size)^2+(z-size-7-15.5)^2)^0.5)-abs(340000*(time(2)));
        else
            f2=((x-250)^2+(y+size/2)^2+(z-5.5-2-15.5)^2)^0.5-((x-250)^2+(y-size/2)^2+(z-5.5-2-15.5)^2)^0.5-340000*(time(2)-time(3));
        end
    end
        
    function f3=f3(x,y,z,type,size)
        if type=="line"
            f3=abs(((x-250)^2+(y+size)^2+(z-size-7-15.5)^2)^0.5-((x-250)^2+(y-size)^2+(z-size-7-15.5)^2)^0.5)-abs(340000*(time(3)));
        else
            f3=((x-250)^2+y^2+(z-5.5-15.5-38)^2)^0.5-((x-250)^2+(y-size/2)^2+(z-5.5-2-15.5)^2)^0.5-340000*(time(1)-time(3));
        end
    end

    %适应度函数
    function j=J(X)
        j=abs(abs(f1(X(1),X(2),X(3),type,size))+abs(f2(X(1),X(2),X(3),type,size))+abs(f3(X(1),X(2),X(3),type,size))-abs(f1(Y(1),Y(2),Y(3),type,size))+abs(f2(Y(1),Y(2),Y(3),type,size))+abs(f3(Y(1),Y(2),Y(3),type,size)));
    end

    %初始化函数
    function i=initialize(n)
        x0=unifrnd(0,240,n,1);
        y0=unifrnd(-120,120,n,1);
        z0=unifrnd(0,240,n,1);
        i=[x0,y0,z0];
    end

    %距离函数
    function d=distance(X,Y)
        d=sum((X-Y).*(X-Y))^0.5;
    end

    %种群初始化
    gen=initialize(n);
    light=zeros(n,1)+l0;
    dis=zeros(n,1)+R0;
    %种群迭代
    for k=1:c
        w=k
        %更新亮度
        s0=zeros(n,1);
        for m=1:length(gen)
            s0(m,:)=J(gen(m,:));
        end
        light=light*(1-p)+s0*r;
        
        %选择移动方向
        gen_ne=[];
        count=[];
        for i=1:length(gen)
            ilist=[];
            light0=light;
            light0(i,:)=[];
            gen0=gen;
            gen0(i,:)=[];
            r0=[];
            c0=0;
            for j=1:length(gen0)
                if distance(gen0(j,:),gen(i,:))<dis(i,:)
                    c0=c0+1;
                end
                if light0(j,:)<light(i,:)
                    if distance(gen0(j,:),gen(i,:))<dis(i,:)
                        r0=[r0,(light0(j,:)-light(i,:))/(sum(light0)-(n-1)*light(i,:))];
                        ilist=[ilist,j];
                    end
                end
            end
            count=[count,c0];
            
            %轮盘赌选择
            index=0;
            if isempty(r0)
                gen_ne=[gen_ne;gen(i,:)];
            else
                for q=2:length(r0)
                    r0(q)=r0(q-1)+r0(q);
                end
                r0=r0/r0(length(r0));
                a=rand();
                for value=1:length(r0)
                    if r0(value)>=a
                        index=value;
                        break
                    end
                end
                gen_ne=[gen_ne;gen0(ilist(index),:)];
            end
        end
        
        %更新位置
        for m=1:length(gen_ne)
            if distance(gen_ne(m,:),gen(m,:))~=0
                gen_ne(m,:)=s*((gen_ne(m,:)-gen(m,:))/distance(gen_ne(m,:),gen(m,:)));
            else
                gen_ne(m,:)=s*(gen_ne(m,:)-gen(m,:));
            end
        end
        gen=gen+gen_ne;
        
        %更新决策域半径
        count=reshape(count,[],1);
        for m=1:length(dis)
            dis(m,:)=min(R,max(3,(dis(m,:)+b*(10-count(m,:)))));
        end
    end
    b=[];
    for v=1:length(gen)
        b=[b;J(gen(v,:))];
    end
    o=b
    e=[];
    for v=1:length(gen)
        if b(v)<5
            e=[e;gen(v,:)];
        end
    end
    y=e;
end
            
              
            
                
                        
                  
            
        
        
    
    

    

        
        

            
        