clear;
clc;
 tic
%%%All BVH files, scripts and functions need to be saved in the same folder before running%%%%%
%%
%%%The data is pulled from the BVH file and stored in the corresponding. Xlsx table file%%%%
Data = importdata('five_motion1Char00.bvh','',inf);
init = 353;   %The starting line of rotation angle data in BVH file is modified according to the number of file nodes
DATA = [];
for n = init : length(Data(:,1))
    data_str = Data{n,1};
    data_num = str2num(data_str);
    DATA = [DATA;data_num];
end
%%Node position coordinate reconstruction%%%
A1 = DATA(:,1:3);
A2 = DATA(:,7:9);
A3 = DATA(:,13:15);
A4 = DATA(:,19:21);
A5 = DATA(:,25:27);
A6 = DATA(:,31:33);
A7 = DATA(:,37:39);
A8 = DATA(:,43:45);
A9 = DATA(:,67:69);
A10 = DATA(:,73:75);
A11 = DATA(:,79:81);
A12 = DATA(:,85:87);
A13 = DATA(:,91:93);
A14 = DATA(:,97:99);
A15 = DATA(:,217:219);
A16 = DATA(:,223:225);
A17 = DATA(:,229:231);
A18 = DATA(:,235:237);
DATA1 = [A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18];

%%%Node rotation angle coordinate reconstruction%%%
B1 = DATA(:,4:6);
B2 = DATA(:,10:12);
B3 = DATA(:,16:18);
B4 = DATA(:,22:24);
B5 = DATA(:,28:30);
B6 = DATA(:,34:36);
B7 = DATA(:,40:42);
B8 = DATA(:,46:48);
B9 = DATA(:,70:72);
B10 = DATA(:,76:78);
B11 = DATA(:,82:84);
B12 = DATA(:,88:90);
B13 = DATA(:,94:96);
B14 = DATA(:,100:102);
B15 = DATA(:,220:222);
B16 = DATA(:,226:228);
B17 = DATA(:,232:234);
B18 = DATA(:,238:240);
DATA2 = [A1,B1,B2,B3,B4,B5,B6,B7,B8,A9,B10,B11,B12,B13,B14,B15,B16,B17,B18];
xlswrite('location_data.xlsx',DATA1); 
xlswrite('rotation angle_data.xlsx',DATA2); 

%%
%%Skeleton diagram and calculation of included angle of bone segment%%%%%%
data = DATA2(:,4:end);
data0 = DATA2(:,1:3);

%%% xx represents the number of frames, data is the data of rotation angle,%%% and Data0 is the initial root node coordinate of P0%%%%
QQ = [];
LL = [];
RLA = [];
%  figure
for xx = 1:5:length(data) 
 [Q,L,RLa] = weizhi_jisuan( xx ,data,data0 ); 
picname = [num2str(xx),'.bmp'];
saveas(gcf,picname)
  QQ = [QQ,Q];        %QQ is the calculated angle set of bone segments of each frame
  LL = [LL,L];      
  RLA = [RLA,RLa];
end
save('Feature', 'QQ','LL','RLA')
hold on
%%
%%%Dynamic graph generation%%%
%gujiatu_gif(609,0.05 );  
%%
%%%Mean value of each bone segment%%%%%%
q1 =QQ(1:2,:);
q11 = mean(q1,1);
q2 = QQ(3:4,:);
q22 = mean(q2,1);
q3 =QQ(5:6,:);
q33 = mean(q3,1);
q4 =QQ(7:8,:);
q44 = mean(q4,1);
%%
QQM = [q11;q22;q33;q44];
Qq = QQM;
save ('huQq','Qq')
%%
t = toc; % Calculate code run time
%  close all