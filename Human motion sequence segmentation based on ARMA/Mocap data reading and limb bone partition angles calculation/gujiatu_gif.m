function [ output_args ] = gujiatu_gif( x,y )

% x1 is the start frame, M is the inter frame interval, X2 is the end frame, and Y is the delay time;
for i=1:x
    str = strcat(num2str(i), '.bmp');
    A=imread(str);
    [I,map]=rgb2ind(A,256);
    if(i==1)
        imwrite(I,map,'movefig.gif','DelayTime',y,'LoopCount',Inf)
    else
        imwrite(I,map,'movefig.gif','WriteMode','append','DelayTime',y)    
    end
end

end

