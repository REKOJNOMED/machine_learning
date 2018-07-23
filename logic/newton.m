function newton(lamda)
load trainSet.txt;
siz=size(trainSet);
dim=siz(1)-1;
num=siz(2);
Y=trainSet(dim+1,1:num);
X=zeros(dim+1,num);
X(1,1:num)=1;
X(2:dim+1,1:num)=trainSet(1:dim,1:num);
w=zeros(1,dim+1);
alpha=0.001;
e=1e-7;  
g=(Y-exp(w*X)./(1+exp(w*X)))*X'-lamda*w;
temp=(exp(w*X)./(1+exp(w*X)));
A=diag(temp);
A=A-A.^2;
H=X*A*X';%%º£É­Õó
while norm(g)>e
    d=(H\g')';
    w=w+alpha*d;
    g=(Y-exp(w*X)./(1+exp(w*X)))*X'-lamda*w;
    A=eye(num);
    temp=(exp(w*X)./(1+exp(w*X)));
    A=diag(temp);
    A=A-A.^2;
    H=X*A*X';
end;
validate(w);