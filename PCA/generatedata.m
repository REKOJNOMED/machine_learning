%����ѡȡk(k<d)������������������������ϼ����˹�����������ݡ�
function generatedata(dim,num)
n=randi(dim);
A=rand(n,dim);
mu=zeros(1,dim);
sigma=ones(1,dim);
trainSet=zeros(num,dim);
for i=1:num
    b=rand(1,n)*10;
    trainSet(i,:)=b*A+mvnrnd(mu,sigma);
end
save('trainSet.txt','trainSet','-ascii');
