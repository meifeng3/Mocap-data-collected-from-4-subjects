function [segment,U,M3] = segmentnote_choose(C,win,r)
%UNTITLED7 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

% segment = [];
% for a = 1:win:length(C)-win
%     C1 = C(a:a+win);
%     adf1 = adftest(C1);
%     if adf1 == 1
%         df1 = C1;
%         df = df1;
%         fprintf('�ö�����ƽ��')
%         [U,M3] = ARMA_output_change(df);
%         [aa,bb] = newpoint_choose( U,M3,a );
%         segment = [segment,bb];
%         %segment = sengment';
%     elseif adf1 == 0
%         df1 = C1;
%         df2 = diff(df1,2);
%         adf2 = adftest(df2);
%         if adf2 == 1
%             df = df2;
%             fprintf('���ײ�ֺ�����ƽ��')
%             %�������룬��ʼARMAģ����ϣ����ڳ���Ϊ25֡���������ڿ���ǰ��5֡��
%             [U,M3] = ARMA_output_change(df); %Qq������Ҫ������������
%             [aa,bb] = newpoint_choose( U,M3,a );
%             segment = [segment,bb];
%             %segment = segment';
%         else
%             fprintf('���ײ�ֺ�����δƽ��')
%         end
%     end
% end
%     MM = [MM,segment];
%     MM = MM';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%�ָ���%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
segment = [];
 
 
    adf1 = adftest(C);
    if adf1 == 1
        df1 = C;
        df = df1;
        fprintf('�ö�����ƽ��')
        [U,M3] = ARMA_output_change(df);
        for i = 1:(win-1):length(C)-(win+2)
            [aa,bb] = point_choose2( i,i+win,U,M3,r);
           segment = [segment,bb];
        end
        %segment = sengment';
    elseif adf1 == 0
        df1 = C;
        df2 = diff(df1,2);
        adf2 = adftest(df2);
        if adf2 == 1
            df = df2;
            fprintf('���ײ�ֺ�����ƽ��')
            %�������룬��ʼARMAģ����ϣ����ڳ���Ϊ25֡���������ڿ���ǰ��5֡��
            [U,M3] = ARMA_output_change(df); %Qq������Ҫ������������
            for i = 1:(win-1):length(C)-(win+2)
                [aa,bb] = point_choose2( i,i+win,U,M3,r);
                segment = [segment,bb];
            end
           
            %segment = segment';
        else
            fprintf('���ײ�ֺ�����δƽ��')
        end
    end

end

