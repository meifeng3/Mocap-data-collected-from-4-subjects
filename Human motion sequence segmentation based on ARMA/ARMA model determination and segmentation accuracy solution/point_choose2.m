function [aa,bb] = point_choose2( x,y,U,M3,r )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%A = regress(U(x:y),M3(x:y)); % ���ϵ������
A1 = corrcoef(U(x:y),M3(x:y)); %����Ŷȼ���
A = A1(1,2);
A = A*A; 
if abs(A) <= 0.6
W = [];
for i = x:y
% for i = 1:50
    dis = abs(U(i)-M3(i));
    W = [W,dis];
end
[aa,bb] = max(W);%aΪֵ�Ĵ�С��bΪֵ��λ�ã�
bb = bb + r + x;
else
    disp('�˶β����ڷָ��')
    bb = 0;
    aa = 0;
end

end













    
