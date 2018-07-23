%pi是1*k矩阵，mu是1*dim*k矩阵，sigma是dim*dim*k矩阵
%num为标量，k表示类别，dim表示数据维度，num表示要生成的数据数量。
function generatedata(pi,mu,sigma,num)
temp=size(mu);
dim=temp(2);
trainSet=zeros(num,dim);
for i=1:num
    %pi给出的类别先验概率确定此次循环生成数据的类别，然后确定相应的均值和协方差矩阵
    k= discretize(rand(1),[0 cumsum(pi)]);
    muk=mu(:,:,k);
    sigmak=sigma(:,:,k);
    trainSet(i,1:dim)=mvnrnd(muk,sigmak);
    if dim==2
        if k==1
             plot(trainSet(i,1),trainSet(i,2),'o','MarkerSize',5,'MarkerEdgeColor','b');hold on;
        elseif k==2
             plot(trainSet(i,1),trainSet(i,2),'o','MarkerSize',5,'MarkerEdgeColor','r');hold on;
        else
             plot(trainSet(i,1),trainSet(i,2),'o','MarkerSize',5,'MarkerEdgeColor','y');hold on;
        end
    end
end;
save('trainSet.txt','trainSet','-ascii');