clearvars; close all; clc;

% f(x) = e^x - 2x + 21
% x = (e^x + 21)/2
% g(x) = (e^x + 21)/2
% g'(x) = (e^x + 21)/2
% (1) Merubah bentuk x = g(x)

x = input('x = ');
ghatx = exp(x)/2;

if abs(ghatx) >= 1
    disp('tidak memenuhi syarat');
    return;
end

fx = exp(x) - 2*x - 21

% for idx = 1:10
iterasi = 0;
while abs(fx) > 1 * 10^(-6)
    iterasi = iterasi + 1;
    fprintf('iterasi ke-%i \n', iterasi);
    x = (exp(x) - 21) / 2
    fx = exp(x) - 2*x - 21
end

fprintf('solusi x = %i \n', x);
fprintf('dengan error = %i \n', fx);;

% function x2 = myIteration(x1)
%     x2 = (exp(x1) + 21) / 2;
% end