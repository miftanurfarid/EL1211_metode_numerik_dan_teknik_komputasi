clc; clear all; clc;

% Data soal 1.
fprintf('\n\nData Soal 1:\n');

x1 = linspace(pi/2,0,5);

fprintf('\nData x = \n');

fprintf('%.4f\n', x1);

y1 = sin(x1);

fprintf('\nData f(x) = \n');

fprintf('%.4f\n', y1);

% SOLUSI SOAL 1 - NEWTON GREGORY FORWARD / NGF
xs = 1.3233
fprintf('\n');
fxs = solxF1(xs, x1, y1);
fprintf('\n');

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

function out = calTable(in)
    
    fx = zeros(length(in))

    for col = 1:length(in)-1
        for row = 1:length(x)-col
            fx(row,col+1) = fx(row+1,col) - fx(row,col);
        end
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