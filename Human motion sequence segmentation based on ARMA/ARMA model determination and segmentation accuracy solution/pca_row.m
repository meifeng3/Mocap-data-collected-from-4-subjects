function [newX,T,meanValue,cols] = pca_row(X,CRate)
%每行是一个样本

% meanValue=ones(size(X,1),1)*mean(X);
%  X=X-meanValue;%每个维度减去该维度的均值

  meanValue1=mean(X,2);
 meanValue = [meanValue1,meanValue1];  %修改处，关节点个数
%  meanValue = meanValue1;

 X=X-meanValue;%每个维度减去该维度的均值
C=X'*X/(size(X,1)-1);%计算协方差矩阵

%计算特征向量，特征值
[V,D]=eig(C);
%将特征向量按降序排序
[dummy,order]=sort(diag(-D));
V=V(:,order);%将特征向量按照特征值大小进行降序排列
d=diag(D);%将特征值取出，构成一个列向量
newd=d(order);%将特征值构成的列向量按降序排列

%取前n个特征向量，构成变换矩阵
sumd=sum(newd);%特征值之和
for j=1:length(newd)
    i=sum(newd(1:j,1))/sumd;%计算贡献率，贡献率=前n个特征值之和/总特征值之和
    if i>CRate%当贡献率大于95%时循环结束,并记下取多少个特征值
        cols = j;
        break;
    end
end

T=V(:,1:cols);%取前cols个特征向量，构成变换矩阵T
newX=X*T;%用变换矩阵T对X进行降维
end
