load trainSet.txt;
dim=size(trainSet,2);
x=trainSet(:,1:(dim-1));
y=trainSet(:,dim);
[vec ,low_x ,val]=pca(x);
judge=cumsum(val)/sum(val);
for i=1:size(judge,1)
    if judge(i)>0.95
        k=i;
        break;
    end
end
X_mean=mean(x);

tranMat=vec(:,(1:k));
low_x=low_x(:,(1:k));
svm_struct=fitcsvm(low_x,y);
load validSet.txt;
x=validSet(:,1:dim-1);
y=validSet(:,dim);
X=x-repmat(X_mean,size(x,1),1);
X=X*tranMat;
group=predict(svm_struct,X);
count=0;
for i=1:size(validSet,1)
    if(group(i)~=y(i))
        count=count+1;
    end
end
count;