function conjugate(lamda)
load trainSet.txt;
siz=size(trainSet);
dim=siz(1)-1;%%计算维度
num=siz(2);%%计算实例数目
Y=trainSet(dim+1,1:num);
X=zeros(dim+1,num);
X(1,1:num)=1;
X(2:dim+1,1:num)=trainSet(1:dim,1:num);
w=zeros(1,dim+1);
g=(Y-exp(w*X)./(1+exp(w*X)))*X'-lamda*w;%%起始点梯度
old_g=inf;
alpha=0.001;
e=1e-7;
d=zeros(1,dim+1);
while norm(g)>e
    beta=norm(g)/norm(old_g);
    d=g+beta*d;
    w=w+alpha*d;
    old_g=g;
    g=(Y-exp(w*X)./(1+exp(w*X)))*X'-lamda*w;
end;
validate(w);
end







