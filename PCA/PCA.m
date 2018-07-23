%返回特征值，特征向量矩阵，变换后的x，转化矩阵，原样本均值
function [val,vec,low_x,tranMat,X_mean]=PCA(trainSet)
X=trainSet;
[num dim]=size(X);
X_mean=mean(X);
%首先预处理数据，先计算数据的均值，记为mean_X，然后所有数据减去这个均值，这一步是为了平衡各维的权值
Y=X-repmat(X_mean,num,1);
S=cov(Y);
%计算S的特征值与特征向量
[vec,val]=eig(S);
val=sum(val);
%把特征值从大到小排列，从中选取前k个使得特征值和占全部特征值和的95%以上
%然后将相应的特征向量组成特征矩阵
[val,index]=sort(val,'descend');
vec=vec(:,index);
judge=cumsum(val)/sum(val);
for i=1:size(judge,2)
    if judge(i)>0.95
        k=i;
        break;
    end
end
%数据的低纬表示
tranMat=vec(:,(1:k));
low_x=Y*vec(:,(1:k));