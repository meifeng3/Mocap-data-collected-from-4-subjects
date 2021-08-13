function [ b ] = find_note( Ture,Mid,m )
%UNTITLED13 此处显示有关此函数的摘要
%   此处显示详细说明
C1 = [];
for p = 1:length(Mid)
    c = abs(Ture(m)-Mid(p));
    C1 = [C1,c];
end
[a,b] = min(C1);

end

