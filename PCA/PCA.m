%��������ֵ�������������󣬱任���x��ת������ԭ������ֵ
function [val,vec,low_x,tranMat,X_mean]=PCA(trainSet)
X=trainSet;
[num dim]=size(X);
X_mean=mean(X);
%����Ԥ�������ݣ��ȼ������ݵľ�ֵ����Ϊmean_X��Ȼ���������ݼ�ȥ�����ֵ����һ����Ϊ��ƽ���ά��Ȩֵ
Y=X-repmat(X_mean,num,1);
S=cov(Y);
%����S������ֵ����������
[vec,val]=eig(S);
val=sum(val);
%������ֵ�Ӵ�С���У�����ѡȡǰk��ʹ������ֵ��ռȫ������ֵ�͵�95%����
%Ȼ����Ӧ���������������������
[val,index]=sort(val,'descend');
vec=vec(:,index);
judge=cumsum(val)/sum(val);
for i=1:size(judge,2)
    if judge(i)>0.95
        k=i;
        break;
    end
end
%���ݵĵ�γ��ʾ
tranMat=vec(:,(1:k));
low_x=Y*vec(:,(1:k));