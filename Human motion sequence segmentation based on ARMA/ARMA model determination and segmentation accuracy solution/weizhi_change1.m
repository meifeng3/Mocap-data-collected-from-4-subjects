function [ Q ] = weizhi_change1( xx ,data,data0)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   xxΪ֡����dataΪ��������ݣ�data0Ϊ���ڵ�ռ�����λ�ã�
data
B=data;
C=B';
D=C(:,xx);  %ȡ�����˶������еĵ�һ֡���޸������л�֡����
data0
B0=data0;
C0=B0';
P0=C0(:,xx);  %ȡ�����˶������еĵ�һ֡���޸������л�֡����
% M0 = [cosd(r)*cosd(p)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
%     sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
%     -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];         %������ڵ㣨�Ų�������ת����
s1 = [];
for i=1:3:57                                        %��Z,X,Y����ת�ǵ�Z��������ѡȡ
   
    b1=D(i,:);
    s1 = [s1,b1]
       
end
R=s1'


s2 = [];
for i=2:3:57                                        %��Z,X,Y����ת�ǵ�X��������ѡȡ
   
    b2=D(i,:);
    s2 = [s2,b2]
    
end
P=s2'


% disp(F)
s3 = [];                                            %��Z,X,Y����ת�ǵ�Y��������ѡȡ
for i=3:3:57                                        
   
    b3=D(i,:);
    s3 = [s3,b3]
    
end
 Y=s3'
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%�����Žڵ���ͷ���ڵ����άλ������%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r=R(1,:)';                                     %��ѡ����ѡȡ����3�����飨��Z,X,Y�ᣩ�еĵ�һ�����ݣ����ǵ�һ���ؽڵ����ת������
p=P(1,:)';
y=Y(1,:)';
M0 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];    %������ڵ㣨�Ų�������ת����

r=R(2,:)';                                       %��ѡ����ѡȡ����3�����飨��Z,X,Y�ᣩ�еĵڶ������ݣ����ǵڶ����ؽڵ����ת������
p=P(2,:)';
y=Y(2,:)';
M1 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];    %���㼹׵����ת����

r=R(3,:)';                                       %��ѡ����ѡȡ����3�����飨��Z,X,Y�ᣩ�еĵ��������ݣ����ǵ������ؽڵ����ת������
p=P(3,:)';
y=Y(3,:)';
M2 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];    %�������������ת����

r=R(4,:)';                                         %��ѡ����ѡȡ����3�����飨��Z,X,Y�ᣩ�еĵ��ĸ����ݣ����ǵ��ĸ��ؽڵ����ת������
p=P(4,:)';
y=Y(4,:)';
M3 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)]; %����ͷ������ת����

r=R(5,:)';                                         %��ѡ����ѡȡ����3�����飨��Z,X,Y�ᣩ�еĵ��ĸ����ݣ����ǵ��ĸ��ؽڵ����ת������
p=P(5,:)';
y=Y(5,:)';
M4 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)]; %����ͷ������ת����

L1 = [0 3.4026 0]';                             %��׵�����ƫ������
L2 = [0 8.4386 -0.6805]';                           %���������ƫ������
L3 = [0 10.2079 -0.2722]';                             %ͷ�������ƫ������
L4 = [0 3.1304 0]'; 

O1 = M0*(M1*L1);                             %��׵��Ը��ڵ�Ĺ�������ϵ��ƫ�ƣ��ݹ��������
O2 = M0*(M1*(M2*L2));                        %����������ŵĹ�������ϵ���꣨�ݹ��������
O3 = M0*(M1*(M2*(M3*L3)));                   %ͷ�������ϥ�Ĺ�������ϵ���꣨�ݹ��������
O4 = M0*(M1*(M2*(M3*(M4*L4))));  
%P0 = [D0(1:xx) D0(2:xx) D0(3:xx)]';                   %���ڵ���������ꣻ��ÿ֡���޸ģ�
P1 = P0 + O1;                                %��׵�ڵ���������ꣻ
P2 = P0 + O1 + O2;                           %�����ڵ���������ꣻ
P3 = P0 + O1 +O2 + O3;                       %ͷ���ڵ���������ꣻ
P4 = P0 + O1 +O2 + O3+O4;
% disp(P0);                                   
% disp(P1);
% disp(P2);
% disp(P3);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%�����Žڵ�������ڵ�λ��%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

r=R(6,:)';                                     %��ѡ����ѡȡ����3�����飨��Z,X,Y�ᣩ�еĵ�һ�����ݣ����ǵ�һ���ؽڵ����ת������
p=P(6,:)';
y=Y(6,:)';
M5 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %���ؽ���ת����

r=R(7,:)';                                     %��ѡ����ѡȡ����3�����飨��Z,X,Y�ᣩ�еĵ�һ�����ݣ����ǵ�һ���ؽڵ����ת������
p=P(7,:)';
y=Y(7,:)';
M6 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %���ϱ۹ؽ���ת����

r=R(8,:)';                                     %��ѡ����ѡȡ����3�����飨��Z,X,Y�ᣩ�еĵ�һ�����ݣ����ǵ�һ���ؽڵ����ת������
p=P(8,:)';
y=Y(8,:)';
M7 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %���±۹ؽ���ת����

r=R(9,:)';                                     %��ѡ����ѡȡ����3�����飨��Z,X,Y�ᣩ�еĵ�һ�����ݣ����ǵ�һ���ؽڵ����ת������
p=P(9,:)';
y=Y(9,:)';
M8 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %����ؽ���ת����

L5 = [3.4707 6.66929 -0.8166]';                             %�������ƫ������
L6 = [3.1985 0 0]';                           %���ϱ۵����ƫ������
L7 = [10.1399 0 0]';                          %���±۵����ƫ������
L8 = [8.3705 0 0]';                        %��������ƫ����

O5 = M0*(M1*(M2*(M5*L5)));                             %�����Ը��ڵ�Ĺ�������ϵ��ƫ�ƣ��ݹ��������
O6 = M0*(M1*(M2*(M5*(M6*L6))));                        %���ϱ�������ŵĹ�������ϵ���꣨�ݹ��������
O7 = M0*(M1*(M2*(M5*(M6*(M7*L7)))));                   %���±������ϥ�Ĺ�������ϵ���꣨�ݹ��������
O8 = M0*(M1*(M2*(M5*(M6*(M7*(M8*L8))))));              %����������±۵Ĺ�������ϵ���꣨�ݹ��������

% P0 = [-0.3952 40.1746 0.2306]';               
P5 = P0 + O1 + O2 + O5;                               
P6 = P0 + O1 + O2 + O5 + O6;                           
P7 =P0 + O1 + O2 + O5 + O6 + O7;                       
P8 = P0 + O1 + O2 + O5 + O6 + O7 + O8;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%�����Źؽ��������λ��%%%%%%%%%%%%%%%%%%%%%%%%%%%

r=R(10,:)';                                     %��ѡ����ѡȡ����3�����飨��Z,X,Y�ᣩ�еĵ�һ�����ݣ����ǵ�һ���ؽڵ����ת������
p=P(10,:)';
y=Y(10,:)';
M9 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %�Ҽ�ؽ���ת����

r=R(11,:)';                                     %��ѡ����ѡȡ����3�����飨��Z,X,Y�ᣩ�еĵ�һ�����ݣ����ǵ�һ���ؽڵ����ת������
p=P(11,:)';
y=Y(11,:)';
M10 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %���ϱ۹ؽ���ת����


r=R(12,:)';                                     %��ѡ����ѡȡ����3�����飨��Z,X,Y�ᣩ�еĵ�һ�����ݣ����ǵ�һ���ؽڵ����ת������
p=P(12,:)';
y=Y(12,:)';
M11 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %���±۹ؽ���ת����

r=R(13,:)';                                     %��ѡ����ѡȡ����3�����飨��Z,X,Y�ᣩ�еĵ�һ�����ݣ����ǵ�һ���ؽڵ����ת������
p=P(13,:)';
y=Y(13,:)';
M12 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %����ؽ���ת����


L9 = [-3.4707 6.66929 -0.8166]';                          
L10 = [-3.1985 0 0]';                          
L11 = [-10.1399 0 0]';                         
L12 = [-8.3705 0 0]';                         
                             

O9 = M0*(M1*(M2*(M9*L9)));                             %�����Ը��ڵ�Ĺ�������ϵ��ƫ�ƣ��ݹ��������
O10 = M0*(M1*(M2*(M9*(M10*L10))));                        %���ϱ�������ŵĹ�������ϵ���꣨�ݹ��������
O11 = M0*(M1*(M2*(M9*(M10*(M11*L11)))));                   %���±������ϥ�Ĺ�������ϵ���꣨�ݹ��������
O12 = M0*(M1*(M2*(M9*(M10*(M11*(M12*L12))))));              %����������±۵Ĺ�������ϵ���꣨�ݹ��������

                   

% P0 = [-0.3952 40.1746 0.2306]';                   
P9 = P0 + O1 + O2 + O9;                               
P10 = P0 + O1 + O2 + O9 + O10;                           
P11 =P0 + O1 + O2 + O9 + O10 + O11;                       
P12 = P0 + O1 + O2 + O9 + O10 + O11 + O12;        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%�����Źؽ������׵�λ��%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

r=R(14,:)';                                     %��ѡ����ѡȡ����3�����飨��Z,X,Y�ᣩ�еĵ�һ�����ݣ����ǵ�һ���ؽڵ����ת������
p=P(14,:)';
y=Y(14,:)';
M13 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %�����ȹؽ���ת����

r=R(15,:)';                                     %��ѡ����ѡȡ����3�����飨��Z,X,Y�ᣩ�еĵ�һ�����ݣ����ǵ�һ���ؽڵ����ת������
p=P(15,:)';
y=Y(15,:)';
M14 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %�����ȹؽ���ת����

r=R(16,:)';                                     %��ѡ����ѡȡ����3�����飨��Z,X,Y�ᣩ�еĵ�һ�����ݣ����ǵ�һ���ؽڵ����ת������
p=P(16,:)';
y=Y(16,:)';
M15 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %���׹ؽ���ת����



L13 = [5.3081 -1.6333 1.3611]';                            
L14 = [-2.0416 -20.0076 0]';                        
L15 = [0 -19.1909 -1.225]';                            

                         
O13 = M0*(M13*L13);                        %��׵��Ը��ڵ�Ĺ�������ϵ��ƫ�ƣ��ݹ��������
O14 = M0*(M13*(M14*L14));                        %���ϱ�������ŵĹ�������ϵ���꣨�ݹ��������
O15 = M0*(M13*(M14*(M15*L15)));         


% P0 = [-0.3952 40.1746 0.2306]';                   %���ڵ���������ꣻ
P13 = P0 +  O13;                               
P14 = P0 ++ O13 + O14;                           
P15 =P0 + O13 + O14 + O15;                       
                 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%�Źؽ������׽ڵ�λ��%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r=R(17,:)';                                     %��ѡ����ѡȡ����3�����飨��Z,X,Y�ᣩ�еĵ�һ�����ݣ����ǵ�һ���ؽڵ����ת������
p=P(17,:)';
y=Y(17,:)';
M16 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %�����ȹؽ���ת����


r=R(18,:)';                                     %��ѡ����ѡȡ����3�����飨��Z,X,Y�ᣩ�еĵ�һ�����ݣ����ǵ�һ���ؽڵ����ת������
p=P(18,:)';
y=Y(18,:)';
M17 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %��������ת����

r=R(19,:)';                                     %��ѡ����ѡȡ����3�����飨��Z,X,Y�ᣩ�еĵ�һ�����ݣ����ǵ�һ���ؽڵ����ת������
p=P(19,:)';
y=Y(19,:)';
M18 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %������ת����

L16 =[-5.3081 -1.6333 1.3611]'; 
L17 = [2.0416 -20.0076 0]';                           
L18 = [0 -19.1909 -1.225]';                             

O16 = M0*(M16*L16);                        %��׵��Ը��ڵ�Ĺ�������ϵ��ƫ�ƣ��ݹ��������
O17 = M0*(M16*(M17*L17));                        %���ϱ�������ŵĹ�������ϵ���꣨�ݹ��������
O18 = M0*(M16*(M17*(M18*L18)));                           
 

P16 = P0 + O16;                               
P17 = P0 + O16 + O17;                          
P18 =P0 + O16 + O17 + O18;                       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp(P0);                         %�Žڵ�����          
disp(P1);                         %��׵�ڵ����� 
disp(P2);                         %�����ڵ����� 
disp(P3);                         %ͷ���ڵ����� 
disp(P4);                         %���ڵ�����                                
disp(P5);                         %���ϱ۽ڵ����� 
disp(P6);                         %���±۽ڵ����� 
disp(P7);                         %����ڵ����� 
disp(P8);                         %�Ҽ�ڵ�����                     
disp(P9);                         %���ϱ۽ڵ����� 
disp(P10);                        %���±۽ڵ����� 
disp(P11);                        %����ڵ����� 
disp(P12);                        %�����Ƚڵ�����                        
disp(P13);                        %�����Ƚڵ����� 
disp(P14);                        %���׽ڵ����� 
disp(P15);                        %�����Ƚڵ����� 
disp(P16);                        %�����Ƚڵ����� 
disp(P17);                        %���׽ڵ����� 
disp(P18); 

%%%%%%%%%%%%���Ǽ�ͼ%%%%%%%%%%%%%%

% x = [P0(1,:)  P1(1,:)  P2(1,:)   P3(1,:) P4(1,:)];
% y = [P0(2,:)  P1(2,:)  P2(2,:)   P3(2,:) P4(2,:)];
% z = [P0(3,:)  P1(3,:)  P2(3,:)   P3(3,:) P4(3,:)];            %����ͷ��
% 
% x1 = [P0(1,:) P1(1,:)  P2(1,:)  P5(1,:)   P6(1,:)   P7(1,:)  P8(1,:)];
% y1 = [P0(2,:) P1(2,:)  P2(2,:)  P5(2,:)   P6(2,:)   P7(2,:)  P8(2,:)];
% z1 = [P0(3,:) P1(3,:)  P2(3,:)  P5(3,:)   P6(3,:)   P7(3,:)  P8(3,:)];           %��������
% 
% 
% x2 = [P0(1,:)  P1(1,:)  P2(1,:) P9(1,:)  P10(1,:)  P11(1,:)  P12(1,:)];
% y2 = [P0(2,:)  P1(2,:)  P2(2,:) P9(2,:)  P10(2,:)  P11(2,:)  P12(2,:)];
% z2 = [P0(3,:)  P1(3,:)  P2(3,:) P9(3,:)  P10(3,:)  P11(3,:)  P12(3,:)];     %��������
% 
% x3 = [P0(1,:)  P13(1,:)   P14(1,:)  P15(1,:) ];
% y3 = [P0(2,:)  P13(2,:)   P14(2,:)  P15(2,:) ];
% z3 = [P0(3,:)  P13(3,:)   P14(3,:)  P15(3,:) ];   %��������
% 
% x4 = [P0(1,:)  P16(1,:)  P17(1,:)   P18(1,:)];
% y4 = [P0(2,:)  P16(2,:)  P17(2,:)   P18(2,:)];
% z4 = [P0(3,:)  P16(3,:)  P17(3,:)   P18(3,:)];                       %��������
% 
% plot3(x,z,y,'ro-',x1,z1,y1,'ro-',x2,z2,y2,'ro-',x3,z3,y3,'ro-',x4,z4,y4,'ro-');
% axis([-50 50 -100 100 -20 120]);
% 
% title(['��',num2str(xx),'֡�Ǽ�ͼ']);
% view(-150,20);
% grid on;
%%%�����μнǼ��㲿��%%%
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


