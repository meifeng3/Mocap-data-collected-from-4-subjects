function [U,M3] = ARMA_output_LL( LLcut,mm)
%UNTITLED17 �˴���ʾ�йش˺�����ժҪ

%[ QQ ] = QQ_jisuan( DATA );
%%
%%%%%��ά���ִ���%%%%%%%
% Xxx = QQ(1:3,:); %ѡȡ��Ҫ��ά�ļ����ؽڵ�
% 
% [newXxx,T,meanValue,cols] = pca_row(Xxx,0.90);
% % G = diff(newX);%�޸Ĵ�����ע�� 
% M=newXxx*T'+meanValue  %��ԭԭʼ����
% C = newXxx;
%%
%%%%%%%%%ARMAģ�ͽ�������%%%%%%%%
C = LLcut(:,mm);

%---------------------Ԥ����----------------------
adf1=adftest(C);           %�ж�ƽ����
df1=diff(C);
%df1 = C;          %�޸Ĵ�
adf2=adftest(df1);
ljz=df1-mean(df1);%���ֵ  Q1:ARMA��ģ�����費��Ҫ���ֵ��
u = iddata(ljz); %ת����Ƶ������ת��Ϊarmaxģ�Ϳ�ʶ����
%-----------------------Ԥ����-------------------------
%-------------------AICȷ������-------------------
test = [];
for p = 0:5                  
for q = 0:5             %�޸Ĵ�
m = armax(u,[p q]);
AIC = aic(m);              %armax(p,q),����AIC������ģ��m��Ӧ��AIC
test = [test;p q AIC];
end
end
for k = 1:size(test,1)
if test(k,3) == min(test(:,3)) %ѡ��AICֵ��С��ģ��
p_test = test(k,1);
q_test = test(k,2);
break;
end
end
%--------------------AICȷ������-------------------
%--------------------armax��ģ--------------------
% figure(1)
% m = armax(u,[p_test q_test]);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
% e = resid(m,u);        %��в�
% plot(e);
% hold on
% ue=get(e,'outputData');
% lbq1=lbqtest(ue)       % �в���� 
%-------------------armax��ģ--------------------
%-----------------Ԥ��--------------------
% figure(2)
%compare(u,m,1)        %Q3��compare������predict������ʲô����  
m3=predict(m,u,1)
% num = printf('%d\n',m3)
%subplot(3,1,1)
plot(u(1:end),'ro-',m3(1:end),'b*-')
% title('��221-292֡')
legend('u','m3')
U = u.outputdata;
M3= m3.outputdata;       %��ȡ��ʵ���ݺ�Ԥ������


%------------------Ԥ��---------------
%----------------arima-------------
m1=arima(p_test,0,q_test)
ima=estimate(m1,ljz) %Q4:���ｨģ�õ��Ĳ���Ϊɶ��ARMAX�õ��Ĳ�һ�£�


end