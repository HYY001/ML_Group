function PlotData(X,y)
pos = find(y==1);
neg = find(y==0);
hold on
plot(X(pos,1),X(pos,2),'k+','linewidth',2,'markersize',7);
plot(X(neg,1),X(neg,2),'ko','markerfacecolor','y','markersize',7);
hold off
end