clear all; close all; clc;

% Solusi Soal No.3
% Tugas Final
% Newton Gregory Backward

xs = 2.2345;

x = [
    0.50000
    0.90000
    1.30000
    1.70000
    2.10000
    2.50000
    2.90000 
    ];

fprintf('');

fx = zeros(length(x));

fx(:,1) = [
    1.7191
    1.5955
    0.7830
    -0.3844
    -1.3764
    -1.6600
    -1.7601
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