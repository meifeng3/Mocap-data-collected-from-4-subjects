function [ Q ] = weizhi_change1( xx ,data,data0)
%UNTITLED 此处显示有关此函数的摘要
%   xx为帧数，data为导入的数据，data0为根节点空间坐标位置；
data
B=data;
C=B';
D=C(:,xx);  %取整个运动序列中的第一帧（修改数字切换帧数）
data0
B0=data0;
C0=B0';
P0=C0(:,xx);  %取整个运动序列中的第一帧（修改数字切换帧数）
% M0 = [cosd(r)*cosd(p)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
%     sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
%     -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];         %计算根节点（髋部）的旋转矩阵；
s1 = [];
for i=1:3:57                                        %对Z,X,Y轴旋转角的Z轴数据做选取
   
    b1=D(i,:);
    s1 = [s1,b1]
       
end
R=s1'


s2 = [];
for i=2:3:57                                        %对Z,X,Y轴旋转角的X轴数据做选取
   
    b2=D(i,:);
    s2 = [s2,b2]
    
end
P=s2'


% disp(F)
s3 = [];                                            %对Z,X,Y轴旋转角的Y轴数据做选取
for i=3:3:57                                        
   
    b3=D(i,:);
    s3 = [s3,b3]
    
end
 Y=s3'
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%计算髋节点至头部节点的三维位置坐标%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r=R(1,:)';                                     %挑选出以选取出的3个数组（即Z,X,Y轴）中的第一个数据，即是第一个关节点的旋转角数据
p=P(1,:)';
y=Y(1,:)';
M0 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];    %计算根节点（髋部）的旋转矩阵；

r=R(2,:)';                                       %挑选出以选取出的3个数组（即Z,X,Y轴）中的第二个数据，即是第二个关节点的旋转角数据
p=P(2,:)';
y=Y(2,:)';
M1 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];    %计算脊椎的旋转矩阵；

r=R(3,:)';                                       %挑选出以选取出的3个数组（即Z,X,Y轴）中的第三个数据，即是第三个关节点的旋转角数据
p=P(3,:)';
y=Y(3,:)';
M2 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];    %计算根颈部的旋转矩阵；

r=R(4,:)';                                         %挑选出以选取出的3个数组（即Z,X,Y轴）中的第四个数据，即是第四个关节点的旋转角数据
p=P(4,:)';
y=Y(4,:)';
M3 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)]; %计算头部的旋转矩阵

r=R(5,:)';                                         %挑选出以选取出的3个数组（即Z,X,Y轴）中的第四个数据，即是第四个关节点的旋转角数据
p=P(5,:)';
y=Y(5,:)';
M4 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)]; %计算头部的旋转矩阵

L1 = [0 3.4026 0]';                             %脊椎的相对偏移量；
L2 = [0 8.4386 -0.6805]';                           %颈部的相对偏移量；
L3 = [0 10.2079 -0.2722]';                             %头部的相对偏移量；
L4 = [0 3.1304 0]'; 

O1 = M0*(M1*L1);                             %脊椎相对根节点的惯性坐标系的偏移（递归迭代）；
O2 = M0*(M1*(M2*L2));                        %颈部相对左髋的惯性坐标系坐标（递归迭代）；
O3 = M0*(M1*(M2*(M3*L3)));                   %头部相对左膝的惯性坐标系坐标（递归迭代）；
O4 = M0*(M1*(M2*(M3*(M4*L4))));  
%P0 = [D0(1:xx) D0(2:xx) D0(3:xx)]';                   %根节点的世界坐标；（每帧需修改）
P1 = P0 + O1;                                %脊椎节点的世界坐标；
P2 = P0 + O1 + O2;                           %颈部节点的世界坐标；
P3 = P0 + O1 +O2 + O3;                       %头部节点的世界坐标；
P4 = P0 + O1 +O2 + O3+O4;
% disp(P0);                                   
% disp(P1);
% disp(P2);
% disp(P3);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%计算髋节点至左腕节点位置%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

r=R(6,:)';                                     %挑选出以选取出的3个数组（即Z,X,Y轴）中的第一个数据，即是第一个关节点的旋转角数据
p=P(6,:)';
y=Y(6,:)';
M5 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %左肩关节旋转矩阵

r=R(7,:)';                                     %挑选出以选取出的3个数组（即Z,X,Y轴）中的第一个数据，即是第一个关节点的旋转角数据
p=P(7,:)';
y=Y(7,:)';
M6 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %左上臂关节旋转矩阵

r=R(8,:)';                                     %挑选出以选取出的3个数组（即Z,X,Y轴）中的第一个数据，即是第一个关节点的旋转角数据
p=P(8,:)';
y=Y(8,:)';
M7 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %左下臂关节旋转矩阵

r=R(9,:)';                                     %挑选出以选取出的3个数组（即Z,X,Y轴）中的第一个数据，即是第一个关节点的旋转角数据
p=P(9,:)';
y=Y(9,:)';
M8 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %左腕关节旋转矩阵

L5 = [3.4707 6.66929 -0.8166]';                             %左肩的相对偏移量；
L6 = [3.1985 0 0]';                           %左上臂的相对偏移量；
L7 = [10.1399 0 0]';                          %左下臂的相对偏移量；
L8 = [8.3705 0 0]';                        %左腕的相对偏移量

O5 = M0*(M1*(M2*(M5*L5)));                             %左肩相对根节点的惯性坐标系的偏移（递归迭代）；
O6 = M0*(M1*(M2*(M5*(M6*L6))));                        %左上臂相对左髋的惯性坐标系坐标（递归迭代）；
O7 = M0*(M1*(M2*(M5*(M6*(M7*L7)))));                   %左下臂相对左膝的惯性坐标系坐标（递归迭代）；
O8 = M0*(M1*(M2*(M5*(M6*(M7*(M8*L8))))));              %左腕相对左下臂的惯性坐标系坐标（递归迭代）；

% P0 = [-0.3952 40.1746 0.2306]';               
P5 = P0 + O1 + O2 + O5;                               
P6 = P0 + O1 + O2 + O5 + O6;                           
P7 =P0 + O1 + O2 + O5 + O6 + O7;                       
P8 = P0 + O1 + O2 + O5 + O6 + O7 + O8;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%计算髋关节至右腕的位置%%%%%%%%%%%%%%%%%%%%%%%%%%%

r=R(10,:)';                                     %挑选出以选取出的3个数组（即Z,X,Y轴）中的第一个数据，即是第一个关节点的旋转角数据
p=P(10,:)';
y=Y(10,:)';
M9 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %右肩关节旋转矩阵

r=R(11,:)';                                     %挑选出以选取出的3个数组（即Z,X,Y轴）中的第一个数据，即是第一个关节点的旋转角数据
p=P(11,:)';
y=Y(11,:)';
M10 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %右上臂关节旋转矩阵


r=R(12,:)';                                     %挑选出以选取出的3个数组（即Z,X,Y轴）中的第一个数据，即是第一个关节点的旋转角数据
p=P(12,:)';
y=Y(12,:)';
M11 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %右下臂关节旋转矩阵

r=R(13,:)';                                     %挑选出以选取出的3个数组（即Z,X,Y轴）中的第一个数据，即是第一个关节点的旋转角数据
p=P(13,:)';
y=Y(13,:)';
M12 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %右腕关节旋转矩阵


L9 = [-3.4707 6.66929 -0.8166]';                          
L10 = [-3.1985 0 0]';                          
L11 = [-10.1399 0 0]';                         
L12 = [-8.3705 0 0]';                         
                             

O9 = M0*(M1*(M2*(M9*L9)));                             %左肩相对根节点的惯性坐标系的偏移（递归迭代）；
O10 = M0*(M1*(M2*(M9*(M10*L10))));                        %左上臂相对左髋的惯性坐标系坐标（递归迭代）；
O11 = M0*(M1*(M2*(M9*(M10*(M11*L11)))));                   %左下臂相对左膝的惯性坐标系坐标（递归迭代）；
O12 = M0*(M1*(M2*(M9*(M10*(M11*(M12*L12))))));              %左腕相对左下臂的惯性坐标系坐标（递归迭代）；

                   

% P0 = [-0.3952 40.1746 0.2306]';                   
P9 = P0 + O1 + O2 + O9;                               
P10 = P0 + O1 + O2 + O9 + O10;                           
P11 =P0 + O1 + O2 + O9 + O10 + O11;                       
P12 = P0 + O1 + O2 + O9 + O10 + O11 + O12;        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%计算髋关节至左踝的位置%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

r=R(14,:)';                                     %挑选出以选取出的3个数组（即Z,X,Y轴）中的第一个数据，即是第一个关节点的旋转角数据
p=P(14,:)';
y=Y(14,:)';
M13 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %左上腿关节旋转矩阵

r=R(15,:)';                                     %挑选出以选取出的3个数组（即Z,X,Y轴）中的第一个数据，即是第一个关节点的旋转角数据
p=P(15,:)';
y=Y(15,:)';
M14 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %左下腿关节旋转矩阵

r=R(16,:)';                                     %挑选出以选取出的3个数组（即Z,X,Y轴）中的第一个数据，即是第一个关节点的旋转角数据
p=P(16,:)';
y=Y(16,:)';
M15 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %左踝关节旋转矩阵



L13 = [5.3081 -1.6333 1.3611]';                            
L14 = [-2.0416 -20.0076 0]';                        
L15 = [0 -19.1909 -1.225]';                            

                         
O13 = M0*(M13*L13);                        %脊椎相对根节点的惯性坐标系的偏移（递归迭代）；
O14 = M0*(M13*(M14*L14));                        %左上臂相对左髋的惯性坐标系坐标（递归迭代）；
O15 = M0*(M13*(M14*(M15*L15)));         


% P0 = [-0.3952 40.1746 0.2306]';                   %根节点的世界坐标；
P13 = P0 +  O13;                               
P14 = P0 ++ O13 + O14;                           
P15 =P0 + O13 + O14 + O15;                       
                 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%髋关节至右踝节点位置%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r=R(17,:)';                                     %挑选出以选取出的3个数组（即Z,X,Y轴）中的第一个数据，即是第一个关节点的旋转角数据
p=P(17,:)';
y=Y(17,:)';
M16 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %右上腿关节旋转矩阵


r=R(18,:)';                                     %挑选出以选取出的3个数组（即Z,X,Y轴）中的第一个数据，即是第一个关节点的旋转角数据
p=P(18,:)';
y=Y(18,:)';
M17 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %右下腿旋转矩阵

r=R(19,:)';                                     %挑选出以选取出的3个数组（即Z,X,Y轴）中的第一个数据，即是第一个关节点的旋转角数据
p=P(19,:)';
y=Y(19,:)';
M18 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %右踝旋转矩阵

L16 =[-5.3081 -1.6333 1.3611]'; 
L17 = [2.0416 -20.0076 0]';                           
L18 = [0 -19.1909 -1.225]';                             

O16 = M0*(M16*L16);                        %脊椎相对根节点的惯性坐标系的偏移（递归迭代）；
O17 = M0*(M16*(M17*L17));                        %左上臂相对左髋的惯性坐标系坐标（递归迭代）；
O18 = M0*(M16*(M17*(M18*L18)));                           
 

P16 = P0 + O16;                               
P17 = P0 + O16 + O17;                          
P18 =P0 + O16 + O17 + O18;                       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp(P0);                         %髋节点坐标          
disp(P1);                         %脊椎节点坐标 
disp(P2);                         %颈部节点坐标 
disp(P3);                         %头部节点坐标 
disp(P4);                         %左肩节点坐标                                
disp(P5);                         %左上臂节点坐标 
disp(P6);                         %左下臂节点坐标 
disp(P7);                         %左腕节点坐标 
disp(P8);                         %右肩节点坐标                     
disp(P9);                         %右上臂节点坐标 
disp(P10);                        %右下臂节点坐标 
disp(P11);                        %右腕节点坐标 
disp(P12);                        %左上腿节点坐标                        
disp(P13);                        %左下腿节点坐标 
disp(P14);                        %左踝节点坐标 
disp(P15);                        %右上腿节点坐标 
disp(P16);                        %右下腿节点坐标 
disp(P17);                        %左踝节点坐标 
disp(P18); 

%%%%%%%%%%%%画骨架图%%%%%%%%%%%%%%

% x = [P0(1,:)  P1(1,:)  P2(1,:)   P3(1,:) P4(1,:)];
% y = [P0(2,:)  P1(2,:)  P2(2,:)   P3(2,:) P4(2,:)];
% z = [P0(3,:)  P1(3,:)  P2(3,:)   P3(3,:) P4(3,:)];            %髋至头部
% 
% x1 = [P0(1,:) P1(1,:)  P2(1,:)  P5(1,:)   P6(1,:)   P7(1,:)  P8(1,:)];
% y1 = [P0(2,:) P1(2,:)  P2(2,:)  P5(2,:)   P6(2,:)   P7(2,:)  P8(2,:)];
% z1 = [P0(3,:) P1(3,:)  P2(3,:)  P5(3,:)   P6(3,:)   P7(3,:)  P8(3,:)];           %髋至左腕
% 
% 
% x2 = [P0(1,:)  P1(1,:)  P2(1,:) P9(1,:)  P10(1,:)  P11(1,:)  P12(1,:)];
% y2 = [P0(2,:)  P1(2,:)  P2(2,:) P9(2,:)  P10(2,:)  P11(2,:)  P12(2,:)];
% z2 = [P0(3,:)  P1(3,:)  P2(3,:) P9(3,:)  P10(3,:)  P11(3,:)  P12(3,:)];     %髋至右腕
% 
% x3 = [P0(1,:)  P13(1,:)   P14(1,:)  P15(1,:) ];
% y3 = [P0(2,:)  P13(2,:)   P14(2,:)  P15(2,:) ];
% z3 = [P0(3,:)  P13(3,:)   P14(3,:)  P15(3,:) ];   %髋至左踝
% 
% x4 = [P0(1,:)  P16(1,:)  P17(1,:)   P18(1,:)];
% y4 = [P0(2,:)  P16(2,:)  P17(2,:)   P18(2,:)];
% z4 = [P0(3,:)  P16(3,:)  P17(3,:)   P18(3,:)];                       %髋至右踝
% 
% plot3(x,z,y,'ro-',x1,z1,y1,'ro-',x2,z2,y2,'ro-',x3,z3,y3,'ro-',x4,z4,y4,'ro-');
% axis([-50 50 -100 100 -20 120]);
% 
% title(['第',num2str(xx),'帧骨架图']);
% view(-150,20);
% grid on;
%%%骨骼段夹角计算部分%%%
Bcenter = P0-P2;
B1 = P6-P7;
B2 = P7-P8;
B3 = P10-P11;
B4 = P11-P12;
B5 = P13-P14;
B6 = P14-P15;
B7 = P16-P17;
B8 = P17-P18;
BB = [B1,B2,B3,B4,B5,B6,B7,B8];
 %disp(BB)
% disp(B1)
%  disp(Bcenter)
% disp(BB(1))
Q = [];
for i =1:8
    ang(i) = acosd((BB(:,i)'*Bcenter)/(norm(BB(:,i))*norm(Bcenter)));
%     Q = [Q,angi];   
end
%  Q = Q';
Q = ang';

end


