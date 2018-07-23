load trainingSet.txt;
size=10;
x=trainingSet(1,1:size);
t=trainingSet(2,1:size);
x2=0:0.01:1;
y2=sin(2*pi*x2);
X=fliplr(vander(x));
i=5;
 XI=X(1:size,1:i+1);
 old_theta=zeros(i+1,1);
 old_j=(XI*old_theta-t')'*(XI*old_theta-t')/(2*size);
 alpha=0.1;
 A=XI'*(XI*old_theta-t');
 new_theta=old_theta-alpha/size*A;
 new_j=(XI*new_theta-t')'*(XI*new_theta-t')/(2*size);
 e=1e-6;
 while norm(A)>=e
     old_theta=new_theta;
     old_j=(XI*old_theta-t')'*(XI*old_theta-t')/(2*size);
     A=XI'*(XI*old_theta-t');
     new_theta=old_theta-alpha/size*A;
     new_j=(XI*new_theta-t')'*(XI*new_theta-t')/(2*size);
 end;
 j=3;
 