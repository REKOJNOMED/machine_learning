X=zeros(20,3840);
for i=1:20
    Xi=im2double(imread([num2str(i),'.pgm']));
    X(i,:)=reshape(Xi,1,60*64);
end;
[~,~,low_x,tranMat,mean_X]=PCA(X);

re_X=low_x*tranMat'+repmat(mean_X,20,1);
X1=im2double(imread('1.pgm'));
re_X1=reshape(re_X(1,:),60,64);
MES=sum(sum((X1-re_X1).^2))/(60*64);
PSNR=20*log10(255/sqrt(MES))

