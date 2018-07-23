
load trainingSet.txt;
x=trainingSet(1,1:10);
y=trainingSet(2,1:10);
x2=0:0.01:1;
y2=sin(2*pi*x2);
for i=0:9
    w=polyfit(x,y,i);
    figure(i+2);
    plot(x,y,'o','MarkerSize',5);hold on;
    plot(x2,y2,'g');hold on;
    plot(x2,polyval(w,x2),'r');hold off;
    axis([0 1 -1.5 1.5]);
    text(0.8,1,sprintf('%s%d','M=',i));
end;