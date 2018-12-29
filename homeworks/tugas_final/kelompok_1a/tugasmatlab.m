clc;
clear;
%f(x) = 2*cos(x) + 2*x + 21
%g(x) = 2*cos(x) + 21 / 2
%g'(x)= -sin(x)
x0=0;
x=2*cos(x0) + 21 / 2;
x1=-sin(x0);
epsilon = 0.0000001;
iterasi=0;
disp('METODE TITIK TETAP untuk persamaan f(x)=2*cos(x) + 2*x + 21');
disp('x=0, epsilon=0.0000001');
disp('iterasi akar');

if -sin(x0) < 1
    fprintf('terpenuhi')
elseif -sin(x0) > 1
    fprintf('tidak terpenuhi')
end
    
while abs(x-x0)>epsilon
x=x0;
x0=2*cos(x0) + 21 / 2;
fprintf(' %3g %10.7f\n',iterasi, x);
iterasi=iterasi+1;
end

akar = x;
fprintf('Akarnya adalah = %8.7f\n', akar);
fprintf('Jumlah Iterasi = %3g\n', iterasi);
 %nilai dengan 8 space dan 7 angka dibelakang koma.
 %nilai dengan 3 space.
