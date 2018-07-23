load trainSet.txt
x=trainSet(:,1:11251);
y=trainSet(:,11252);
[a b c]=pca(x);
judge=cumsum(c)/sum(c);
for i=1:size(judge,1)
    if judge(i)>0.95
        k=i;
        break;
    end
end
temp=b(:,1:k);
temp(:,k+1)=y;
save('trainSetPCA.txt','temp','-ascii');