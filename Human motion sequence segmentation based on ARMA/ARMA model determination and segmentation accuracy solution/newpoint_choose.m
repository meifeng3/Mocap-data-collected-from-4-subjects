function [aa,bb] = newpoint_choose( U,M3,a )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
%A = regress(U(x:y),M3(x:y)); % 相关系数检验
A1 = corrcoef(U,M3); %拟合优度检验
A = A1(1,2);
A = A*A; 
if abs(A) <= 0.7
W = [];
for i = 1:length(U)
% for i = 1:50
    dis = abs(U(i)-M3(i));
    W = [W,dis];
end
[aa,bb] = max(W);%a为值的大小，b为值的位置；
bb = bb + a;
else
    disp('此段不存在分割点')
    bb = 0;
    aa = 0;
end

end
