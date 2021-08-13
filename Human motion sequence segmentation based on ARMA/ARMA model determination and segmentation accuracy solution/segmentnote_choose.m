function [segment,U,M3] = segmentnote_choose(C,win,r)
%UNTITLED7 此处显示有关此函数的摘要
%   此处显示详细说明

% segment = [];
% for a = 1:win:length(C)-win
%     C1 = C(a:a+win);
%     adf1 = adftest(C1);
%     if adf1 == 1
%         df1 = C1;
%         df = df1;
%         fprintf('该段数据平稳')
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
%             fprintf('二阶差分后数据平稳')
%             %数据输入，开始ARMA模型拟合，窗口长度为25帧（后续窗口可向前放5帧）
%             [U,M3] = ARMA_output_change(df); %Qq部分需要滑动窗口输入
%             [aa,bb] = newpoint_choose( U,M3,a );
%             segment = [segment,bb];
%             %segment = segment';
%         else
%             fprintf('二阶差分后数据未平稳')
%         end
%     end
% end
%     MM = [MM,segment];
%     MM = MM';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%分割线%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
segment = [];
 
 
    adf1 = adftest(C);
    if adf1 == 1
        df1 = C;
        df = df1;
        fprintf('该段数据平稳')
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
            fprintf('二阶差分后数据平稳')
            %数据输入，开始ARMA模型拟合，窗口长度为25帧（后续窗口可向前放5帧）
            [U,M3] = ARMA_output_change(df); %Qq部分需要滑动窗口输入
            for i = 1:(win-1):length(C)-(win+2)
                [aa,bb] = point_choose2( i,i+win,U,M3,r);
                segment = [segment,bb];
            end
           
            %segment = segment';
        else
            fprintf('二阶差分后数据未平稳')
        end
    end

end

