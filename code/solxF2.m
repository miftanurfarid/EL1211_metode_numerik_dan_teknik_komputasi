clearvars; close all; clc;

% Solusi Soal No.2
% Tugas Final
% Newton Gregory Backward

xs = 3.3875;

x = [
    1
    1.5
    2
    2.5
    3
    3.5
    4
    ];

fprintf('');

fx = zeros(length(x));

fx(:,1) = [
    -0.369
    -0.0704
    0.3407
    0.1578
    -0.7106
    -1.5934
    -1.643
    ];

fprintf('');

for col = 1 : (length(x) - 1)
    for row = length(x) : -1 : (1 + col)
        fx(row,col+1) = fx(row,col) - fx(row-1,col);
    end
end

s = calS(xs, x(1), x(2));
fxs = calNGB(s, fx, length(x));

fprintf('Untuk x = %.4f maka f(x) = %.4f\n\n', xs, fxs);

% persamaan NGB
function y = calNGB(s, fx, pol)
    f = fx(1,1);    % f0
    % fprintf('f0 = %.4f\n', f)
    for idx = 2:pol
        if idx == 2
            f = f + ( s * fx(1,idx) / calFac(idx-1) );
        else
            s = s * (s - (idx - 2));
            f = f + ( s * fx(1,idx) / calFac(idx-1) );
        end
        % fprintf('f%i = %.4f\n', idx - 1, f)
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