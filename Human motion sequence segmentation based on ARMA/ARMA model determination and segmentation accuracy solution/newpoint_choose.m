function [aa,bb] = newpoint_choose( U,M3,a )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%A = regress(U(x:y),M3(x:y)); % ���ϵ������
A1 = corrcoef(U,M3); %����Ŷȼ���
A = A1(1,2);
A = A*A; 
if abs(A) <= 0.7
W = [];
for i = 1:length(U)
% for i = 1:50
    dis = abs(U(i)-M3(i));
    W = [W,dis];
end
[aa,bb] = max(W);%aΪֵ�Ĵ�С��bΪֵ��λ�ã�
bb = bb + a;
else
    disp('�˶β����ڷָ��')
    bb = 0;
    aa = 0;
end

end
