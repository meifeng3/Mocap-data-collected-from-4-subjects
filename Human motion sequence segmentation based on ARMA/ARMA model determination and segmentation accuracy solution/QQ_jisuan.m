function [ QQ ] = QQ_jisuan( DATA )
%UNTITLED13 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
data = DATA(:,4:end);
data0 = DATA(:,1:3);

QQ = [];

for xx  = 1:length(DATA) %�л�֡�����������֡�ĸ����Ƕεļн�
  [Q] = weizhi_change1( xx ,data,data0 );
  QQ = [QQ,Q];
end


fprintf('�����Ƕμн�����')
QQ
end

