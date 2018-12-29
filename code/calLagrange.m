% function fxs = calLagrange(xs,x,fx)
%     % menghitung 
%     % 

%     len = length(x);
%     fxs = zeros(size(fx));

%     for i = 1:len

%         for j = 1:len

%             if j == 1
%                 num = 1;
%             end

%             if j == i
%                 continue;
%             else
%                 num = num * (xs - x(j));
%             end

%         end



%     end

% end

clear; close all; clc;

xs = pi/2;

x = [1.5708 1.1781 0.7854 0.3927 0];

fx = [1 0.9239 0.7071 0.3827 0];

df1 = (sin(xs-x(2))*sin(xs-x(3))*sin(xs-x(4))*sin(xs-x(5))) / ...
 (sin(x(1)-x(2))*sin(x(1)-x(3))*sin(x(1)-x(4))*sin(x(1)-x(5))) * ...
 fx(1);

df2 = (sin(xs-x(1))*sin(xs-x(3))*sin(xs-x(4))*sin(xs-x(5))) / ...
 (sin(x(2)-x(1))*sin(x(2)-x(3))*sin(x(2)-x(4))*sin(x(2)-x(5))) * ...
 fx(2);

df3 = (sin(xs-x(1))*sin(xs-x(2))*sin(xs-x(4))*sin(xs-x(5))) / ...
 (sin(x(3)-x(1))*sin(x(3)-x(2))*sin(x(3)-x(4))*sin(x(3)-x(5))) * ...
 fx(3);

df4 = (sin(xs-x(1))*sin(xs-x(2))*sin(xs-x(3))*sin(xs-x(5))) / ...
 (sin(x(4)-x(1))*sin(x(4)-x(2))*sin(x(4)-x(3))*sin(x(4)-x(5))) * ...
 fx(4);
 
df5 = (sin(xs-x(1))*sin(xs-x(2))*sin(xs-x(3))*sin(xs-x(4))) / ...
 (sin(x(5)-x(1))*sin(x(5)-x(2))*sin(x(5)-x(3))*sin(x(5)-x(4))) * ...
 fx(5);

fxs = df1 + df2 + df3 + df4 + df5
% for idx = 1:3
%     if idx == 2
%         continue
%     else
%         idx
%     end
% end
