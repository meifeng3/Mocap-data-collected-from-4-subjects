clc;clear all
 load('huQq.mat')  
% 
% 
load('ture165.mat')
Ture = ture4;

% load('ture170.mat')
% Ture = ture3;
% 
% load('ture175.mat')
% Ture = ture2;
 
% load('ture180.mat')
% Ture = ture1;
%

% load('170xiongdownlimbs.mat')
% Qq1 = newX;
% load('170xionguplimbs.mat')
% Qq2 = newX;
% Qq = [Qq1,Qq2];



 Qq = Qq';


%%%%%%%right leg%%%%%%%
Segment1 = [];
M31 = [];
U1 = [];
for r = 1:99:length(Qq)-(100+2)
C = Qq(r:r+99,1);
[segment1,UU1,MM1] = segmentnote_choose(C,25,r); 
Segment1 = [Segment1,segment1];
M31 = [M31,MM1'];
U1 = [U1,UU1'];
end
% %%%%%%%%%%%left leg%%%%%%%
Segment2 = [];
M32 = [];
U2 = [];
for r = 1:99:length(Qq)-(100+2)
C = Qq(r:r+99,2);
[segment2,UU2,MM2] = segmentnote_choose(C,25,r); 
Segment2 = [Segment2,segment2];
M32 = [M32,MM2'];
U2 = [U2,UU2'];
end

%%%%%%%%%%%right hand%%%
Segment3 = [];
M33 = [];
U3 = [];
for r = 1:99:length(Qq)-(100+2)
C = Qq(r:r+99,3);
[segment3,UU3,MM3] = segmentnote_choose(C,25,r); 
Segment3 = [Segment3,segment3];
M33 = [M33,MM3'];
U3 = [U3,UU3'];
end

%%%%%%left hand%%%%%%%%%%
Segment4 = [];
M34 = [];
U4 = [];
for r = 1:99:length(Qq)-(100+2)
C = Qq(r:r+99,4);
[segment4,UU4,MM4] = segmentnote_choose(C,25,r); %This function inputs the sequence and window length
Segment4 = [Segment4,segment4];
M34 = [M34,MM4'];
U4 = [U4,UU4']; 
end

fprintf('Right leg Segmentation points')
Segment1

fprintf('Left leg Segmentation points')
Segment2

fprintf('Right hand Segmentation points')
Segment3

fprintf('Left hand Segmentation points')
Segment4
MM = [Segment1',Segment2',Segment3',Segment4'];
% MM = [Segment1',Segment2'];
MM = MM';
% SEG=[place1;place2;place3;place4];
Mid = [];
for i = 1:length(MM)
   seg = MM(:,i);
   seg(seg == 0) = [];
    mid = median(seg);
    Mid = [Mid,mid];
end
save Mid
fprintf('Segmentation points after median filtering')
Mid

%%


Fs1 = [];
C1 = [];
for p = 1:length(Mid)
    c = abs(Ture(1)-Mid(p));
    C1 = [C1,c];
end
[a,b] = min(C1);
S1 = Mid(b);
Fs1 = [Fs1,S1];
%%%%%%%
Fs2 = [];
C1 = [];
for p = 1:length(Mid)
    c = abs(Ture(2)-Mid(p));
    C1 = [C1,c];
end
[a,b] = min(C1);
S1 = Mid(b);
Fs2 = [Fs2,S1];
%%%%%%%%%%%%%%%%%%%
Fs3 = [];
C1 = [];
for p = 1:length(Mid)
    c = abs(Ture(3)-Mid(p));
    C1 = [C1,c];
end
[a,b] = min(C1);
S1 = Mid(b);
Fs3 = [Fs3,S1];
%%%%%%%%%%%%%%%
Fs4 = [];
C1 = [];
for p = 1:length(Mid)
    c = abs(Ture(4)-Mid(p));
    C1 = [C1,c];
end
[a,b] = min(C1);
S1 = Mid(b);
Fs4 = [Fs4,S1];


FS = [Fs1,Fs2,Fs3,Fs4];
fprintf('segmentation point between actions')
FS
% zx = length(C)/50;
% Zx = round(zx)*4;
% 
% for pp = 1:Zx
%     h(pp) = figure(pp);
%     saveas(gcf,'pp.fig')
% end
%%
%%%%%%%%%Accuracy calculation%%%%%
Acc = [];
for q = 1:length(Ture)
    if q ==1
        acc = abs(FS(q)-Ture(q))/Ture(q);
        acc = 1-acc;
    else
        acc = abs(FS(q)-Ture(q))/(Ture(q)-Ture(q-1));
        acc = 1-acc;
    end
    Acc = [Acc,acc];
end
ACC = [];
for i = 1:length(Acc)
   me = [num2str(Acc(i)*100),'%'];
   ACC = [ACC,me];
end
fprintf('Accuracy')
ACC


















