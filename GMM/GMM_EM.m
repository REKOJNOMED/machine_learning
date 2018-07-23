function [pi,mu,sigma,gama]=GMM_EM(k,trainSet)
[num,dim]=size(trainSet);
X=trainSet;
%%在初始的数据中随机选取k个数据作为初始mu值即初始中心，
%然后计算样本到这些中心的距离矩阵即dis(i,k)表示第i个样本到第k个中心的距离，
%然后依据距离矩阵确定初始每个样本的类别，对于每个类别k对应的数据Xk，
%pi(k)就是Xk占所有数据的比例，sigma(:,:,k)就是xk的协方差
rand_index=randperm(num);
center=X(rand_index(1:k),:);
dis_matrix=repmat(sum(X.*X,2),1,k)+repmat(sum((center.*center),2)',num,1)-2*X*center';
[~,label]=min(dis_matrix,[],2);
pi=zeros(1,k);
mu=zeros(1,dim,k);
sigma=zeros(dim,dim,k);
for i=1:k
    mu(:,:,i)=center(i,:);
    Xk=X(label==i,:);
    pi(i)=size(Xk,1)/num;
    sigma(:,:,i)=cov(Xk);
end
pre_likelihood=inf;
likelihood=inf;
deta=inf;
gama=zeros(num,k);
while deta>1e-20
    %计算第i个样本属于第k类的概率
    for i=1:num
        xi=X(i,:);       
        for j=1:k
            gama(i,j)=pi(j)*N(xi,mu(:,:,j),sigma(:,:,j));
        end
    end;
    pre_likelihood=likelihood;
    likelihood=sum(log(sum(gama,2)));
    deta=abs(likelihood-pre_likelihood);
    gama=gama./repmat((sum(gama,2)),1,k);
    %求得似然函数最大值所对应的参数
    for i=1:k
        gamak=gama(:,i);
        pi(i)=sum(gamak)/num;
        mu(:,:,i)=sum(repmat(gamak,1,dim).*X)/sum(gamak);
        sigmai=zeros(dim,dim);
        for j=1:num
            xj=X(j,:);
            sigmai=sigmai+gama(j,i)*(xj-mu(:,:,i))'*(xj-mu(:,:,i));
        end
        sigmai=sigmai/sum(gamak);
        sigma(:,:,i)=sigmai;
    end
end
[~,label]=max(gama,[],2);
if dim==2
    for i=1:num
        if label(i)==1
             plot(trainSet(i,1),trainSet(i,2),'o','MarkerSize',5,'MarkerEdgeColor','b');hold on;
        elseif label(i)==2
             plot(trainSet(i,1),trainSet(i,2),'o','MarkerSize',5,'MarkerEdgeColor','r');hold on;
        else
             plot(trainSet(i,1),trainSet(i,2),'o','MarkerSize',5,'MarkerEdgeColor','y');hold on;
        end
    end
end
end

function p=N(x,mu,sigma)
siz=size(x);
p=exp(-(x-mu)*(sigma^-1)*(x-mu)'/2)/sqrt((2*3.1416)^siz(2)*det(sigma));
end

    



