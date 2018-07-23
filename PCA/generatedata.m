%任意选取k(k<d)个向量，并且以他们线性组合加入高斯噪声生成数据。
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
