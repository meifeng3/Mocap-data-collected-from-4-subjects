function [ b ] = find_note( Ture,Mid,m )
%UNTITLED13 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
C1 = [];
for p = 1:length(Mid)
    c = abs(Ture(m)-Mid(p));
    C1 = [C1,c];
end
[a,b] = min(C1);

end

