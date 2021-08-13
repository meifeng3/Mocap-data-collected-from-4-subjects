clear
clc
H = xlsread('Z_Q.csv');
% A = diff(H(:,7));  %对左膝节点数据提取，并一阶差分
% B = diff(H(:,8));
% C = diff(H(:,9));
A = H(:,7);
B = H(:,8);
C = H(:,9);
H = [A,B,C];
% H1 = [2,5,6;4,8,5;8,5,4];
ss = [];
RE = []; 
for n = 1:length(H(:,1))
    a = H(n,1:3);           % H(n,1:3)中的3为节点的旋转角XYZ若增加至n个节点，则为3n；
[u h v] = svd(a);
lambda = u * h(:,1);
re = lambda * v(:,1);
re = re';
RE = [RE;re];               %恢复值
ss = [ss;lambda];             %压缩降维后的一维值
end
disp(ss)
disp(RE)


% figure(1)
% subplot(2,2,1)
% plot(s,'g-');
% title('旋转角降维后的数据');
% axis([0 300 -10 10]);
% grid on
% hold on
% subplot(2,2,2)
% plot(RE(:,1),'r-')
% title('Z轴旋转角的数据');
% grid on
% hold on
% subplot(2,2,3)
% plot(RE(:,2),'g-')
% title('X轴旋转角的数据');
% grid on
% hold on
% subplot(2,2,4)
% plot(RE(:,3),'b-')
% title('Y轴旋转角的数据');
% grid on
% hold on
% 
% 
% figure(2)
% subplot(2,1,1)
% plot(s);
% xticks(0:5:300);%设置X轴的分度值；
% xlabel('帧数');
% ylabel('旋转角度值');
% title('旋转角降维后的数据');
% grid on
% axis([0,300 -20,20]);
% subplot(2,1,2)
% plot(RE(:,1),'r-');
% hold on
% plot(RE(:,2),'g');
% hold on
% plot(RE(:,3),'b');
% hold on
% legend('Z轴','X轴','Y轴');
% grid on
% xticks(0:5:300);
% axis([0,300 -20,20]);











