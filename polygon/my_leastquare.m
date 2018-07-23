function my_leastquare(i)
load trainingSet.txt;%%载入样本点
size=length(trainingSet);
x=trainingSet(1,1:size);
t=trainingSet(2,1:size);
x2=0:0.01:1;
y2=sin(2*pi*x2);
X=fliplr(vander(x));%%生成范德蒙矩阵
    w=sym('w',[i+1 1]);
    XI=X(1:size ,1:i+1);
    A=XI'*(XI*w-t');%%代价函数的一阶导数
    w=solve(A);
    v=zeros(1,i+1);
    if i==0 
        v=double(w);
    else
        for j=1:i+1
            v(j)=double(getfield(w,['w',num2str(j)]));
        end;
    end;
    figure(i+1)
    plot(x,t,'o','MarkerSize',5);hold on;
    plot(x2,y2,'g');hold on;
    plot(x2,polyval(fliplr(double(v)),x2),'r');hold off;
    axis([0 1 -1.5 1.5]);
    text(0.8,1,sprintf('%s%d','M=',i));