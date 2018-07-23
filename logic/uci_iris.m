
[attrib1, attrib2, attrib3, attrib4, class] = textread('iris.data', '%f%f%f%f%s', 'delimiter', ',');
attrib=[attrib1';attrib2'; attrib3'; attrib4'];
a=zeros(150,1);
%%��Iris-setosa��Ϊ1�������������Ϊ0���
a(strcmp(class, 'Iris-setosa')) = 1; 
a(strcmp(class, 'Iris-versicolor')) = 0; 
a(strcmp(class, 'Iris-virginica')) = 0; 
a=a';
set=zeros(5,150);
set(1:4,1:150)=attrib;
set(5,1:150)=a;
%%��set���������������
rand=randperm(150);
set=set(:,rand);
trainSet=set(1:5,1:50);
save('trainSet.txt','trainSet','-ascii');
validSet=set(1:5,51:150);
save('validSet.txt','validSet','-ascii');