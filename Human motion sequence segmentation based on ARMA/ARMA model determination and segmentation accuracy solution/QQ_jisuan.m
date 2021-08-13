function [ QQ ] = QQ_jisuan( DATA )
%UNTITLED13 此处显示有关此函数的摘要
%   此处显示详细说明
data = DATA(:,4:end);
data0 = DATA(:,1:3);

QQ = [];

for xx  = 1:length(DATA) %切换帧的数量，算各帧的各个骨段的夹角
  [Q] = weizhi_change1( xx ,data,data0 );
  QQ = [QQ,Q];
end


fprintf('各个骨段夹角数据')
QQ
end

