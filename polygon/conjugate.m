function conjugate(i,lamda)
load trainingSet.txt;
size=10;
x=trainingSet(1,1:size);
t=trainingSet(2,1:size);
x2=0:0.01:1;
y2=sin(2*pi*x2);
X=fliplr(vander(x));
XI=X(1:size,1:i+1);
v=zeros(i+1,1);
g=XI'*(XI*v-t')+lamda*v;%%起始点梯度
old_g=inf;
alpha=0.001;
e=1e-7;
d=zeros(i+1,1);
while norm(g)>e
    beta=norm(g)/norm(old_g);
    d=-g+beta*d;
    v=v+alpha*d;
    old_g=g;
    g=XI'*(XI*v-t')+lamda*v;
end;
figure(i+1);
plot(x,t,'o','MarkerSize',5);hold on;
plot(x2,y2,'g');hold on;
plot(x2,polyval(fliplr(v'),x2),'r');hold off;
axis([0 1 -1.5 1.5]);
text(0.6,1,sprintf('%s%d%s%d','M=',i,',lamda=',lamda));
