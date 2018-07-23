clear;
train=loadjson('train.json');
j=1;
for i=1:1604
x=train{1,i};
if(strcmp(x.inc_angle,'na')==1)
    continue;
else
x=[(x.band_1+x.band_2)/2 x.inc_angle x.is_iceberg];
trainSet(j,:)=x;
j=j+1;
end
end
temp=trainSet(1:700,:);
save('trainSet.txt','temp','-ascii');
temp=trainSet(701:1471,:);
save('validSet.txt','temp','-ascii');