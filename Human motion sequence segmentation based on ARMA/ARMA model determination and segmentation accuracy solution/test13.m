clear
clc
H = xlsread('Z_Q.csv');
% A = diff(H(:,7));  %����ϥ�ڵ�������ȡ����һ�ײ��
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
    a = H(n,1:3);           % H(n,1:3)�е�3Ϊ�ڵ����ת��XYZ��������n���ڵ㣬��Ϊ3n��
[u h v] = svd(a);
lambda = u * h(:,1);
re = lambda * v(:,1);
re = re';
RE = [RE;re];               %�ָ�ֵ
ss = [ss;lambda];             %ѹ����ά���һάֵ
end
disp(ss)
disp(RE)


% figure(1)
% subplot(2,2,1)
% plot(s,'g-');
% title('��ת�ǽ�ά�������');
% axis([0 300 -10 10]);
% grid on
% hold on
% subplot(2,2,2)
% plot(RE(:,1),'r-')
% title('Z����ת�ǵ�����');
% grid on
% hold on
% subplot(2,2,3)
% plot(RE(:,2),'g-')
% title('X����ת�ǵ�����');
% grid on
% hold on
% subplot(2,2,4)
% plot(RE(:,3),'b-')
% title('Y����ת�ǵ�����');
% grid on
% hold on
% 
% 
% figure(2)
% subplot(2,1,1)
% plot(s);
% xticks(0:5:300);%����X��ķֶ�ֵ��
% xlabel('֡��');
% ylabel('��ת�Ƕ�ֵ');
% title('��ת�ǽ�ά�������');
% grid on
% axis([0,300 -20,20]);
% subplot(2,1,2)
% plot(RE(:,1),'r-');
% hold on
% plot(RE(:,2),'g');
% hold on
% plot(RE(:,3),'b');
% hold on
% legend('Z��','X��','Y��');
% grid on
% xticks(0:5:300);
% axis([0,300 -20,20]);











