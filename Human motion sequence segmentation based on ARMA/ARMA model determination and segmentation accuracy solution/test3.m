figure(1)
% A = [M31(:,1)',M31(:,2)',M31(:,3)',M31(:,4)',M31(:,5)'];
% B = [U1(:,1)',U1(:,2)',U1(:,3)',U1(:,4)',U1(:,5)'];
plot(M31,'lineWidth',1.5,'markerSize',20)
hold on
plot(U1,'lineWidth',1.5,'markerSize',20)
set(gca,'FontWeight','bold','fontSize',45)
legend('Fitting sequence','Measurement sequence')
xlabel('Sampling point/frame')
ylabel('Amplitude')
axis([0 700 -20 20])

figure(2)
% A1 = [M32(:,1)',M32(:,2)',M32(:,3)',M32(:,4)',M32(:,5)'];
% B1 = [U2(:,1)',U2(:,2)',U2(:,3)',U2(:,4)',U2(:,5)'];
plot(M32,'lineWidth',1.5,'markerSize',20)
hold on
plot(U2,'lineWidth',1.5,'markerSize',20)
set(gca,'FontWeight','bold','fontSize',45)
legend('Fitting sequence','Measurement sequence')
xlabel('Sampling point/frame')
ylabel('Amplitude')
axis([0 700 -20 20])

figure(3)
% A2 = [M33(:,1)',M33(:,2)',M33(:,3)',M33(:,4)',M33(:,5)'];
% B2 = [U3(:,1)',U3(:,2)',U2(:,3)',U3(:,4)',U3(:,5)'];
plot(M33,'lineWidth',1.5,'markerSize',20)
hold on
plot(U3,'lineWidth',1.5,'markerSize',20)
set(gca,'FontWeight','bold','fontSize',45)
legend('Fitting sequence','Measurement sequence')
xlabel('Sampling point/frame')
ylabel('Amplitude')
axis([0 700 -20 20])
figure(4)
% A3 = [M34(:,1)',M34(:,2)',M34(:,3)',M34(:,4)',M34(:,5)'];
% B3 = [U4(:,1)',U4(:,2)',U4(:,3)',U4(:,4)',U4(:,5)'];
plot(M34,'lineWidth',1.5,'markerSize',20)
hold on
plot(U4,'lineWidth',1.5,'markerSize',20)
set(gca,'FontWeight','bold','fontSize',45)
legend('Fitting sequence','Measurement sequence')
xlabel('Sampling point/frame')
ylabel('Amplitude')
axis([0 700 -20 20])