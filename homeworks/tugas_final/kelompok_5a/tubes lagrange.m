clc;clear;
%membangun objek simbolik x
syms x;
%menginputkan banyaknya titik
b=input('Banyak titik = ');
%menginputkan masing-masing titik
for i=1:b
  fprintf('x%d',i)
  bx(i)=input(' = ');
  fprintf('y%d',i)
   by(i)=input(' = ');
end
clc;
%menampilkan titik-titik yang sudah diinputkan ke layar
disp('Titik-titik yang diketahui adalah sebagai berikut:');
for i=1:b
   fprintf('(%d,%1.1f)',bx(i),by(i));
end
%inisialisasi fx
fx=0;
fprintf('\n\n');
disp('Nilai masing-masing L(x)');

% mulai proses pencarian q(x), qx1, lx, dan px
for i=1:b
  %inisialisasi qx
  qx=1;

   %perulangan untuk mencari qx
  for j=1:b
    if (i~=j)
     qx=qx*(x-bx(j));
    end
  end
%mencari qx1 dengan substitusi x ke gx
qx1=subs(qx,x,bx(i));
%mencari lx
lx=qx/qx1;
lx1=collect(lx);

  %menampilkan lx
  fprintf('L%d(x) = ',i); 
  disp(lx1);

%mencari fx
  fx=fx+by(i)*lx;
end
%menyederhanakan fx menjadi px dan menampilkan ke layar
px=collect(fx);
fprintf('Hasilnya = ');
disp(px);