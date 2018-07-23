%%mu 2��dim��������sigmaΪ1��dim��������p��0-1�ֲ��Ĳ�����num1�����ɵ�
%%ѵ����������num2����֤��������flag=1��ʾx��λ��������flag=0��ʾ��ά����
function generatedata(mu,sigma,dim,P,num1,num2,flag)
trainSet=zeros(dim+1,num1);
validSet=zeros(dim+1,num2);%%��ʼ����Ԥ����ռ�
if flag==1   %%x��ά���������ø�˹���Ϸֲ��������ݡ� ���Ϊ0ʱ��mu�ĵ�һ����Ϊ��ֵ�����Ϊ1ʱ�ڶ�����Ϊ��ֵ��sigma��ΪЭ����
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
else%% ��ά������ÿһά�ȷ����Լ��ĸ�˹�ֲ���
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
