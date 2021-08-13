function [ Q,L,RLa ] = weizhi_jisuan( xx ,data,data0)


data
B=data;
C=B';
D=C(:,xx); 
data0
B0=data0;
C0=B0';
P0=C0(:,xx); 

s1 = [];
for i=1:3:54                                      
    
    b1=D(i,:);
    s1 = [s1,b1]
    
end
R=s1'


s2 = [];
for i=2:3:54                                       
    
    b2=D(i,:);
    s2 = [s2,b2]
    
end
P=s2'


% disp(F)
s3 = [];                                            
for i=3:3:54
    
    b3=D(i,:);
    s3 = [s3,b3]
    
end
Y=s3'
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Calculate the three-dimensional position coordinates from hip node to left ankle node%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r=R(1,:)';                                     
p=P(1,:)';
y=Y(1,:)';
M0 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];  
r=R(2,:)';                                       
p=P(2,:)';
y=Y(2,:)';
M1 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];    

r=R(3,:)';                                       
p=P(3,:)';
y=Y(3,:)';
M2 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];    

r=R(4,:)';                                         
p=P(4,:)';
y=Y(4,:)';
M3 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];


L1 = [-9.625 -1.639 0]';                             
L2 = [0 -43.12 0]';                           
L3 = [0 -43.12 0]';                            

O1 = M0*(M1*L1);                             
O2 = M0*(M1*(M2*L2));                       
O3 = M0*(M1*(M2*(M3*L3)));                   

%P0 = [D0(1:xx) D0(2:xx) D0(3:xx)]';                 
P1 = P0 + O1;                                
P2 = P0 + O1 + O2;                          
P3 = P0 + O1 +O2 + O3;                     

% disp(P0);
% disp(P1);
% disp(P2);
% disp(P3);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%Calculate the position from hip node to right ankle node%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

r=R(5,:)';                                     
p=P(5,:)';
y=Y(5,:)';
M4 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];     

r=R(6,:)';                                   
p=P(6,:)';
y=Y(6,:)';
M5 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       

r=R(7,:)';                                     
p=P(7,:)';
y=Y(7,:)';
M6 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];      


L4 = [9.625 -1.639 0]';                             
L5 = [0 -43.12 0]';                          
L6 = [0 -43.12 0]';                            

O4 = M0*(M4*L4);                            
O5 = M0*(M4*(M5*L5));                        
O6 = M0*(M4*(M5*(M6*L6)));                  

% P0 = [-0.3952 40.1746 0.2306]';                  
P4 = P0 + O4;                                
P5 = P0 + O4 + O5;                          
P6 = P0 + O4 +O5 + O6;                      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%% Calculate the position of the hip joint to the head%%%%%%%%%%%%%%%%%%%%%%%%%%%

r=R(8,:)';                                     
p=P(8,:)';
y=Y(8,:)';
M7 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       

r=R(9,:)';                                    
p=P(9,:)';
y=Y(9,:)';
M8 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       

r=R(10,:)';                                    
p=P(10,:)';
y=Y(10,:)';
M9 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       %

L7 = [0 24.755 0]';                            
L8 = [0 10.713 0]';                          
L9 = [0 9.72 0]';                           

O7 = M0*(M7*L7);                           
O8 = M0*(M7*(M8*L8));                       
O9 = M0*(M7*(M8*(M9*L9)));                   
% O10 = M0*(M7*(M8*(M9*(M10*L10))));          
% O11 = M0*(M7*(M8*(M9*(M10*(M11*L11)))));    


% P0 = [-0.3952 40.1746 0.2306]';                  
P7 = P0 + O7;                               
P8 = P0 + O7 + O8;                          
P9 = P0 + O7 + O8 + O9;                     
% P10 = P0 + O7 + O8 + O9 + O10;              
% P11 = P0 + O7 + O8 + O9 + O10 + O11;         
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%Calculate the position of the hip joint to the right wrist%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

r=R(11,:)';                                     
p=P(11,:)';
y=Y(11,:)';
M10 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       

r=R(12,:)';                                    
p=P(12,:)';
y=Y(12,:)';
M11 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       

r=R(13,:)';                                    
p=P(13,:)';
y=Y(13,:)';
M12 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];     

r=R(14,:)';                                    
p=P(14,:)';
y=Y(14,:)';
M13 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       

%L10 = [-3.275 7 0]';                            
L10 = [-15 7 0]';
L11 = [-13.1 0 0]';                          
%L12 = [-27.25 0 0]';                            
L12 = [-20 0 0]'; 
%L13 = [-26.75 0 0]';                             
L13 = [-10 0 0]'; 
O10 = M0*(M7*(M10*L10));                           
O11 = M0*(M7*(M10*(M11*L11)));                      
O12 = M0*(M7*(M10*(M11*(M12*L12))));                
O13 = M0*(M7*(M10*(M11*(M12*(M13*L13)))));           


% P0 = [-0.3952 40.1746 0.2306]';                  
P10 = P0 + O7 + O10;                               
P11 = P0 + O7 + O10 + O11;                         
P12 = P0 + O7 + O10 + O11 + O12;                  
P13 = P0 + O7 + O10 + O11 + O12 + O13;             
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%Hip joint to left wrist node%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

r=R(15,:)';                                    
p=P(15,:)';
y=Y(15,:)';
M14 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];      

r=R(16,:)';                                    
p=P(16,:)';
y=Y(16,:)';
M15 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];      

r=R(17,:)';                                    
p=P(17,:)';
y=Y(17,:)';
M16 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];       

r=R(18,:)';                                     
p=P(18,:)';
y=Y(18,:)';
M17 = [cosd(r)*cosd(y)-sind(r)*sind(p)*sind(y) -sind(r)*cosd(p) cosd(r)*sind(y)+sind(r)*sind(p)*cosd(y);...
    sind(r)*cosd(y)+cosd(r)*sind(p)*sind(y) cosd(r)*cosd(p) sind(r)*sind(y)-cosd(r)*sind(p)*cosd(y);...
    -cosd(p)*sind(y) sind(p) cosd(p)*cosd(y)];      

%L14 = [3.275 7.142 0]';                            
L14 = [15 7.142 0]'; 
L15 = [13.1 0 0]';
%L16 = [27.75 0 0]';                            
L16 = [20 0 0]'; 
%L17 = [26.75 0 0]';                               
L17 = [10 0 0]'; 
O14 = M0*(M7*(M14*L14));                            
O15 = M0*(M7*(M14*(M15*L15)));
O16 = M0*(M7*(M14*(M15*(M16*L16))));                           
O17 = M0*(M7*(M14*(M15*(M16*(M17*L17)))));      

P14 = P0 + O7 + O14;                               
P15 = P0 + O7 + O14 + O15;
P16 = P0 + O7 + O14 + O15 + O16;                              
P17 = P0 + O7 + O14 + O15 + O16 + O17;                          
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp(P0);                        
disp(P1);                        
disp(P2);                       
disp(P3);                       
disp(P4);                         
disp(P5);                         
disp(P6);                         
disp(P7);                         
disp(P8);                         
disp(P9);                         
disp(P10);                        
disp(P11);                        
disp(P12);                        
disp(P13);                        
disp(P14);                        
disp(P15);                        
disp(P16);                        
disp(P17);                        

%%
%%%%%%%%%%%%Draw a skeleton diagram%%%%%%%%%%%%%%

x = [P0(1,:)  P1(1,:)  P2(1,:)   P3(1,:)];
y = [P0(2,:)  P1(2,:)  P2(2,:)   P3(2,:)];
z = [P0(3,:)  P1(3,:)  P2(3,:)   P3(3,:)];           

x1 = [P0(1,:)  P4(1,:)  P5(1,:)   P6(1,:)];
y1 = [P0(2,:)  P4(2,:)  P5(2,:)   P6(2,:)];
z1 = [P0(3,:)  P4(3,:)  P5(3,:)   P6(3,:)];         


x2 = [P0(1,:)  P7(1,:)  P8(1,:)   P9(1,:)];
y2 = [P0(2,:)  P7(2,:)  P8(2,:)   P9(2,:)];
z2 = [P0(3,:)  P7(3,:)  P8(3,:)   P9(3,:)];    

x3 = [P0(1,:)  P7(1,:)  P10(1,:)   P11(1,:)  P12(1,:)  P13(1,:)];
y3 = [P0(2,:)  P7(2,:)  P10(2,:)   P11(2,:)  P12(2,:)  P13(2,:)];
z3 = [P0(3,:)  P7(3,:)  P10(3,:)   P11(3,:)  P12(3,:)  P13(3,:)];               

x4 = [P0(1,:)  P7(1,:)  P14(1,:)   P15(1,:)  P16(1,:)  P17(1,:)];
y4 = [P0(2,:)  P7(2,:)  P14(2,:)   P15(2,:)  P16(2,:)  P17(2,:)];
z4 = [P0(3,:)  P7(3,:)  P14(3,:)   P15(3,:)  P16(3,:)  P17(3,:)];                   
figure(xx)
 plot3(x,z,y,'ko-',x1,z1,y1,'ro-',x2,z2,y2,'ro-',x3,z3,y3,'ko-',x4,z4,y4,'ro-');
%plot3(x,z,y,'bo-',x1,z1,y1,'bo-',x2,z2,y2,'bo-',x3,z3,y3,'bo-',x4,z4,y4,'bo-');
axis([-300 300 -1500 1500 -25 200]);

title(['the',num2str(xx),'Frame skeleton']);
view(165,10);
grid on;
%%
%%%Bone segment angle calculation part%%%
Bcenter = P0-P7;
B1 = P1-P2;   
B2 = P2-P3;  
B3 = P4-P5;   
B4 = P4-P6;   
B5 = P10-P11; 
B6 = P11-P12; 
B7 = P14-P15; 
B8 = P15-P16; 
BB = [B1,B2,B3,B4,B5,B6,B7,B8];
% disp(BB)
% disp(B1)
% % disp(Bcenter)
% disp(BB(1))
Q = [];
for i =1:8
    angi = acosd((BB(:,i)'*Bcenter)/(norm(BB(:,i))*norm(Bcenter)));
    Q = [Q,angi];
    
end
Q = Q';

%%
%%%%%%%%%%%%%Calculation of included angle between right boom and right jib and between left boom and left jib%%%%%%%%%%%%%
AngleRLsim = acosd((B1(:,1)'*B2(:,1))/(norm(B1(:,1))*norm(B2(:,1))));
AngleLLsim = acosd((B3(:,1)'*B4(:,1))/(norm(B3(:,1))*norm(B4(:,1))));
AngleRsim = acosd((B5(:,1)'*B6(:,1))/(norm(B5(:,1))*norm(B6(:,1))));
AngleLsim = acosd((B7(:,1)'*B8(:,1))/(norm(B7(:,1))*norm(B8(:,1))));
RLa = [AngleRLsim;AngleLLsim;AngleRsim;AngleLsim];
%%
%%%%%%Distance from the midpoint of each bone segment to the central joint point%%%%%%%
Pm1 = (P1+P2)/2;
Pm2 = (P2+P3)/2;
Pm3 = (P4+P5)/2;
Pm4 = (P5+P6)/2;
Pm5 = (P11+P12)/2;
Pm6 = (P12+P13)/2;
Pm7 = (P15+P16)/2;
Pm8 = (P16+P17)/2;
PM= [Pm1,Pm2,Pm3,Pm4,Pm5,Pm6,Pm7,Pm8];
L = [];
for i = 1:8
    ll = sqrt((PM(1,i)-P0(1))^2+(PM(2,i)-P0(2))^2+(PM(3,i)-P0(3))^2);
    L = [L,ll];

end
L = L';
end