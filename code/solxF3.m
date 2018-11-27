clear all; close all; clc;

% Solusi Soal No.4
% Tugas Final
% Stirling

% xs yang diketahui
xs = 3.3875;

% x yang diketahui
x = [
    1
    1.5
    2
    2.5
    3
    3.5
    4
    ];

% fx yang diketahui
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

n = length(x);

if mod(n,2) == 1
    zro = (n - 1) / 2 + 1;
else
    zro = n / 2;
end

