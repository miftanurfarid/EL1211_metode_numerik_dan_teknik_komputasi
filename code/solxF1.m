% clear all; close all; clc;

function fxs = solxF1(xs,x,Fx)
% Solusi Soal No.2
% Tugas Final
% Newton Gregory Forward

fx = zeros(length(x));

fx(:,1) = Fx;

for col = 1:length(x)-1
    for row = 1:length(x)-col
        fx(row,col+1) = fx(row+1,col) - fx(row,col);
    end
end

fx

s = calS1(xs, x(1), x(2))
fxs = calNGF1(s, fx, length(x));

end

% persamaan NGF
function y = calNGF1(s, fx, pol)
    f = fx(1,1);    % f0
    for idx = 2:pol
        if idx == 2
            % fprintf('delF = %.4f\n',fx(1,idx))
            f = f + ( s * fx(1,idx) / calFac1(idx-1) );
            sn = s;
        else
            % fprintf('delF = %.4f\n',fx(1,idx))
            sn = sn * (s - (idx - 2));
            f = f + ( sn * fx(1,idx) / calFac1(idx-1) );
        end
        fprintf('fxs = %.04f\n\n', f);
    end
    y = f;
end

% hitung S
function s = calS1(xs, x0, x1)
    s = (xs - x0)/(x1 - x0);
end

% hitung factorial
function z = calFac1(x)
    y = x;
    while y > 1
        x = x * (y - 1);
        y = y - 1;
    end
    z = x;
end