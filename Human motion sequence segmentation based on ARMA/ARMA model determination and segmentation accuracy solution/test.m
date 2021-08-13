clear;
clc;
%%%%所有bvh文件、脚本和函数需保存在同一文件夹下方可运行%%%%%
Data = importdata('ActionPak.bvh','',inf);
init = 120;   %bvh文件中旋转角数据起始行，根据文件节点个数的不同修改
DATA = [];
for n = init : length(Data(:,1))
    data_str = Data{n,1};
    data_num = str2num(data_str);
    DATA = [DATA;data_num];
end
% data0 = DATA(1:end,1:3);
% data = DATA(1:end,4:end);
% figure
% for xx= 1:length(DATA)  %起始帧至结束帧
% weizhi_change1(xx,data,data0);%1代表帧数，data为旋转角部分的数据，data0为P0初始根节点坐标；
% 
% picname = [num2str(xx),'.bmp'];
% saveas(gcf,picname)
% end
% hold on
 %xlswrite('walktorun1.xlsx',DATA); %在图集文件夹下新建excel表格读入数据