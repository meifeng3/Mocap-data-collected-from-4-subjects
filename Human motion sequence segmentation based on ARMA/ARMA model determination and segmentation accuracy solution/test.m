clear;
clc;
%%%%����bvh�ļ����ű��ͺ����豣����ͬһ�ļ����·�������%%%%%
Data = importdata('ActionPak.bvh','',inf);
init = 120;   %bvh�ļ�����ת��������ʼ�У������ļ��ڵ�����Ĳ�ͬ�޸�
DATA = [];
for n = init : length(Data(:,1))
    data_str = Data{n,1};
    data_num = str2num(data_str);
    DATA = [DATA;data_num];
end
% data0 = DATA(1:end,1:3);
% data = DATA(1:end,4:end);
% figure
% for xx= 1:length(DATA)  %��ʼ֡������֡
% weizhi_change1(xx,data,data0);%1����֡����dataΪ��ת�ǲ��ֵ����ݣ�data0ΪP0��ʼ���ڵ����ꣻ
% 
% picname = [num2str(xx),'.bmp'];
% saveas(gcf,picname)
% end
% hold on
 %xlswrite('walktorun1.xlsx',DATA); %��ͼ���ļ������½�excel����������