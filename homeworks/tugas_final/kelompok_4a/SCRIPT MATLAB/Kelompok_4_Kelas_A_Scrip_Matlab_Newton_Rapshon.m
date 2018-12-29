%KELOMPOK 4%
%ANGGOTA:% 
%1. Kevin C. Sumbung (04161036)%
%2. Ahmad Fahmi (04171006)% 
%3. Andhika Naufal Zein (04171011)%
%4. Deva Ayuk Kurniawati (04171021)%
%5. Juan Novly Azareel (04171037)%
% -- PROGRAM METODE NEWTON -- %
clear
clc
format long
fx = input('Isikan persamaan non-linearnya (string) : ');
x0 = input('Isikan nilai awal : ');
maks = input('Isikan maksimum iterasinya : ');
tol = input('Isikan toleransinya : ');
iter=0;
h=0.5;
fprintf('======================================================\n');
fprintf('iter x f(x) df(x) galat\n');
fprintf('======================================================\n');
while iter<maks
f=inline(fx);
fun=f(x0);
fak = (f(x0+h)-f(x0-h))/(2*h);
Es=abs((x0-fun/fak)-x0)/abs(x0-fun/fak);
if fak==0
break
elseif Es<tol
akar=x0-fun/fak;
break
else
x0=x0-fun/fak;
end
fprintf('%3d %3.6f %3.6f %3.6f %3.6f\n',iter+1,x0,fun,fak,Es);
iter=iter+1;
end
akar=x0;
func=f(akar);
%grafik fungsi (x0)
t=-10:10;
z=f(t);
plot(t,z),title('Grafik fungsi (x)');
grid on;
fprintf('======================================================\n');
fprintf(1,' Akarnya : %10.5f \n',akar) ;
fprintf(1,' dengan toleransi : %10.5f \n',tol) ;
fprintf(1,' dan pada iterasi ke : %10g \n',iter) ;