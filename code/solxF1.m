% clear all; close all; clc;

function fxs = solxF1(xs,x,Fx)
% Solusi Soal No.2
% Tugas Final
% Newton Gregory Forward

% xs = 1.1875;

% x = [
%     1
%     1.5
%     2
%     2.5
%     3
%     3.5
%     4
%     ];

fx = zeros(length(x));

% fx(:,1) = [
%     -0.369
%     -0.0704
%     0.3407
%     0.1578
%     -0.7106
%     -1.5934
%     -1.643
%     ];

fx(:,1) = Fx;

for col = 1:length(x)-1
    for row = 1:length(x)-col
        fx(row,col+1) = fx(row+1,col) - fx(row,col);
    end
end

s = calS(xs, x(1), x(2));
fxs = calNGF(s, fx, length(x));

end

% persamaan NGF
function y = calNGF(s, fx, pol)
    f = fx(1,1);    % f0
    for idx = 2:pol
        if idx == 2
            f = f + ( s * fx(1,idx) / calFac(idx-1) );
        else
            s = s * (s - (idx - 2));
            f = f + ( s * fx(1,idx) / calFac(idx-1) );
        end
    end
    y = f;
end

% hitung S
function s = calS(xs, x0, x1)
    s = (xs - x0)/(x1 - x0);
end

% hitung factorial
function z = calFac(x)
    y = x;
    while y > 1
        x = x * (y - 1);
        y = y - 1;
    end
    z = x;
end