%pi��1*k����mu��1*dim*k����sigma��dim*dim*k����
%numΪ������k��ʾ���dim��ʾ����ά�ȣ�num��ʾҪ���ɵ�����������
function generatedata(pi,mu,sigma,num)
temp=size(mu);
dim=temp(2);
trainSet=zeros(num,dim);
for i=1:num
    %pi����������������ȷ���˴�ѭ���������ݵ����Ȼ��ȷ����Ӧ�ľ�ֵ��Э�������
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