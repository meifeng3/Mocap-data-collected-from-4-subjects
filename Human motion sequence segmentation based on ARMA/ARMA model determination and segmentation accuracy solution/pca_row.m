function [newX,T,meanValue,cols] = pca_row(X,CRate)
%ÿ����һ������

% meanValue=ones(size(X,1),1)*mean(X);
%  X=X-meanValue;%ÿ��ά�ȼ�ȥ��ά�ȵľ�ֵ

  meanValue1=mean(X,2);
 meanValue = [meanValue1,meanValue1];  %�޸Ĵ����ؽڵ����
%  meanValue = meanValue1;

 X=X-meanValue;%ÿ��ά�ȼ�ȥ��ά�ȵľ�ֵ
C=X'*X/(size(X,1)-1);%����Э�������

%������������������ֵ
[V,D]=eig(C);
%��������������������
[dummy,order]=sort(diag(-D));
V=V(:,order);%������������������ֵ��С���н�������
d=diag(D);%������ֵȡ��������һ��������
newd=d(order);%������ֵ���ɵ�����������������

%ȡǰn���������������ɱ任����
sumd=sum(newd);%����ֵ֮��
for j=1:length(newd)
    i=sum(newd(1:j,1))/sumd;%���㹱���ʣ�������=ǰn������ֵ֮��/������ֵ֮��
    if i>CRate%�������ʴ���95%ʱѭ������,������ȡ���ٸ�����ֵ
        cols = j;
        break;
    end
end

T=V(:,1:cols);%ȡǰcols���������������ɱ任����T
newX=X*T;%�ñ任����T��X���н�ά
end
