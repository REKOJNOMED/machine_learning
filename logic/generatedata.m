%%mu 2行dim列向量，sigma为1行dim列向量，p是0-1分布的参数，num1是生成的
%%训练集数量，num2是验证集数量，flag=1表示x各位不独立，flag=0表示各维独立
function generatedata(mu,sigma,dim,P,num1,num2,flag)
trainSet=zeros(dim+1,num1);
validSet=zeros(dim+1,num2);%%初始化，预分配空间
if flag==1   %%x各维不独立，用高斯联合分布生成数据。 类别为0时用mu的第一行作为均值，类别为1时第二行作为均值，sigma做为协方差
    mu1=mu(1,1:dim);
    mu2=mu(2,1:dim);
    for i=1:num1
        y=binornd(1,P);
        if y==0
            trainSet(1:dim,i)=mvnrnd(mu1,sigma,1);
            trainSet(dim+1,i)=y;
        else
            trainSet(1:dim,i)=mvnrnd(mu2,sigma,1);
            trainSet(dim+1,i)=y;
        end;
    end;
    save('trainSet.txt','trainSet','-ascii');
    for i=1:num2
        y=binornd(1,P);
        if y==0
            validSet(1:dim,i)=mvnrnd(mu1,sigma,1);
            validSet(dim+1,i)=y;
        else
            validSet(1:dim,i)=mvnrnd(mu2,sigma,1);
            validSet(dim+1,i)=y;
        end;
    end;
    save('validSet.txt','validSet','-ascii');
else%% 各维独立，每一维度符合自己的高斯分布。
    for i=1:num1
        y=binornd(1,P);
        if y==0
            for j=1:dim
                trainSet(j,i)=normrnd(mu(1,j),sigma(j));
            end;
            trainSet(dim+1,i)=y;
        else
            for j=1:dim
                trainSet(j,i)=normrnd(mu(2,j),sigma(j));
            end;
            trainSet(dim+1,i)=y;
        end;
    end;
    save('trainSet.txt','trainSet','-ascii');
    for i=1:num2
        y=binornd(1,P);
        if y==0
            for j=1:dim
                validSet(j,i)=normrnd(mu(1,j),sigma(j));
            end;
            validSet(dim+1,i)=y;
        else
            for j=1:dim
                validSet(j,i)=normrnd(mu(2,j),sigma(j));
            end;
            validSet(dim+1,i)=y;
        end;
    end;
    save('validSet.txt','validSet','-ascii');
end;
end
