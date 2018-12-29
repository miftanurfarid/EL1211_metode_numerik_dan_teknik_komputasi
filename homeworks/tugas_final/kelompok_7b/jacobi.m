clc
clear
A = [3.2 -1 2 22 2.55, 1.1 2 10 23 1.2, 2 -2 17 12 0.70, -5
13 5 4 -1.27, 6 4 9 8 -10.2];
b = [4.2 3.3 6.4 7.6 9.5]*;
N = 20;
n = size[A, 1];
D = diag|diag[A]|;
L = tril |-A, -1|;
u = triu |-A, 1|
Tj = inv|D| * |L+D|;
Oj = inv|D| * b;
tol = 1e-05;
k = 1;
x = zeros|n,1|;
while k <= N
x[I, k+1] = Tj * x[I, k] + Oj;
if norm[x|I, k+1] – x[I, k] < tol
disp[k];
disp[“x = “];
disp[x|I, k+1];
end
k = k + 1;
end