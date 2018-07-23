
function gradientdescent(i,lamda)
load trainingSet.txt;
size=length(trainingSet);
x=trainingSet(1,1:size);
t=trainingSet(2,1:size);
x2=0:0.01:1;
y2=sin(2*pi*x2);
X=fliplr(vander(x));  
    XI=X(1:size,1:i+1);%%取范德蒙矩阵前n列
    v=zeros(i+1,1);
    alpha=0.1;
    e=1e-6;
    g=-(XI'*(XI*v-t')+lamda*v);
    while norm(g)>=e
        v=v+alpha*g;
        g=-(XI'*(XI*v-t')+lamda*v);
    end;
    %%绘图，原函数，样本点，拟合曲线。
    figure(i+1);
    plot(x,t,'o','MarkerSize',5);hold on;
    plot(x2,y2,'g');hold on;
    plot(x2,polyval(fliplr(double(v')),x2),'r');hold off;
    axis([0 1 -1.5 1.5]);
    text(0.8,1,sprintf('%s%d','M=',i));