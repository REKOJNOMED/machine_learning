function validate(w)
load validSet.txt
siz=size(validSet);
dim=siz(1)-1;
num=siz(2);
Y=validSet(dim+1,1:num);
X=validSet(1:dim,1:num);
if dim==2
    for i=1:num
        temp=X(1:dim,i);
        if Y(i)==0
            plot(temp(1),temp(2),'o','MarkerSize',5,'color','b');
            hold on;
        else
            plot(temp(1),temp(2),'o','MarkerSize',5,'color','r');
            hold on;
        end;
    end;
    x=-2:0.01:2;
    y=-(w(2)/w(3))*x-w(1)/w(3);
    plot(x,y,'LineWidth',5);
else  
    z=w(1)+w(2:dim+1)*X;
    for i=1:num
        if z(i)>0
            z(i)=0;
        else
            z(i)=1;
        end;
    end;    
    res=z-Y;
    c1=0;
    for i=1:num
        if res(i)~=0;
            c1=c1+1;
        end;
    end;
    if c1>num/2
        z=1-z;
        c1=num-c1;
    end;
    disp('原类别');
    disp(Y);
    disp('逻辑回归类别');
    disp(z);
    disp(['共',num2str(num),'个数据','分类错误的有',num2str(c1),'个']);
end;
end