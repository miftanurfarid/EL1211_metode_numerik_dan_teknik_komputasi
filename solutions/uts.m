clear; close all; clc;

fprintf('\n\n####################\n\n')
% 3.a) titik tetap
x1d = 30
x1 = 30/180*pi
% x1 = 0.6

abs(sec(x1)*tan(x1))
abs(sec(x1)*tan(x1)) < 1

x2 = sec(x1) - 1

x3 = sec(x2) - 1

x4 = sec(x3) - 1

fprintf('\n\n####################\n\n')
% 3.b) newton-raphson
% x1d = 60
x1 = 0
f0 = sec(x1) - x1 - 1
f1 = sec(x1)*tan(x1) - 1
f2 = sec(x1)*(tan(x1)^2+sec(x1)^2)

abs(f0*f2 / f1^2) < 1

x2 = x1 - f0/f1

f0 = sec(x2) - x2 - 1
f1 = sec(x2)*tan(x2) - 1

x3 = x2 - f0/f1

f0 = sec(x3) - x3 - 1
f1 = sec(x3)*tan(x3) - 1

x4 = x3 - f0/f1

sec(x4) - x4 - 1

fprintf('\n\n####################\n\n')