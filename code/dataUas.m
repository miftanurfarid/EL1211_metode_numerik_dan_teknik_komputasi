clc; clear all; clc;

% Data soal 1.
fprintf('\n\nData Soal 1:\n');

x1 = linspace(pi/2,0,5);

fprintf('\nData x = \n');

fprintf('%.4f\n', x1);

y1 = sin(x1);

fprintf('\nData f(x) = \n');

fprintf('%.4f\n', y1);


% Data soal 3 %
fprintf('\n\nData Soal 3:\n');

x3 = linspace(0,pi/2,6);

fprintf('\nData x = \n');

fprintf('%.4f\n', x3);

y3 = x3.^2 + 2*sin(x3);

fprintf('\nData f(x) = \n');

fprintf('%.4f\n', y3);


% Data soal 4 %
fprintf('\n\nData Soal 4a:\n');

x4 = linspace(pi/2,pi,7);

fprintf('\nData x = \n');

fprintf('%.4f\n', x4);

y4 = x4.^2 + 2*cos(x4) + x4;

fprintf('\nData f(x) = \n');

fprintf('%.4f\n', y4);

fprintf('\n\nData Soal 4b:\n');

x4 = linspace(pi/2,pi,7);

fprintf('\nData x = \n');

fprintf('%.4f\n', x4);

y4 = (1/2)*x4.^3 - cos(x4) - x4;

fprintf('\nData f(x) = \n');

fprintf('%.4f\n', y4);
