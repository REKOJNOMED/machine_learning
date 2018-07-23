function generatedata(sigma,num)
x=linspace(0,1,num);
y=sin(2*pi*x);
t=normrnd(0,sigma,1,num);
y=y+t;
trainingSet=[x;y];
save('trainingSet.txt','trainingSet','-ascii');
end
