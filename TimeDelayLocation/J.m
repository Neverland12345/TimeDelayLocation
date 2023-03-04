%适应度
function j=J(X,time,type,size)
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
    a=abs(f1(X(1),X(2),X(3),type,size))
    b=abs(f2(X(1),X(2),X(3),type,size))
    c=abs(f3(X(1),X(2),X(3),type,size))
    %j=1/(abs(f1(X(1),X(2),X(3),type,size))+abs(f2(X(1),X(2),X(3),type,size))+abs(f3(X(1),X(2),X(3),type,size)))
    j=abs(f1(X(1),X(2),X(3),type,size))+abs(f2(X(1),X(2),X(3),type,size))+abs(f3(X(1),X(2),X(3),type,size));
end