disp('Matrik A')
A=[8 1 2 3 2; 4 9 1 1 1; 3 1 7 1 1; 3 1 1 8 2; 1 2 3 2 9];

disp('Matrik H')
H=[20; 50; 32; 40; 45];

n=rank(A);

L=zeros(n);
U=eye(n);
for s=1:n
j=s;
for i=j:n
    L(i,j)=A(i,j)-L(i,1:(j-1))*U(1:(j-1),j);
end

i=s;
U(i,i)=1;
for j=i+1:n
    U(i,j)=(A(i,j)-L(i,1:(i-1))*U(1:(i-1),j))/(L(i,i));
end
end

disp('A')
disp('Periksa Matrik A')
check=int8 (L*U)
if check==A
    disp(sprintf ('Matrik L*U=A Benar'))
else
    disp(sprintf ('Ada Kesalahan'))
end

xstar_soln(n)=0;
xstar_soln=xstar_soln';
xstar_soln(1)=H(1)/L(1,1);
for i=2:n
    xstar_soln(i)=(H(i,1)-L(i,1:i-1)*xstar_soln(1:i-1))/L(i,i);
end

x_soln(n)=0;
x_soln=x_soln';
x_soln(n)=xstar_soln(n);
i=n-1;
while i>0
    x_soln(i)=xstar_soln(i)-U(i,i+1:n)*x_soln(i+1:n);
    i=i-1;
end
disp('L')
disp('Matrik Segitiga Bawah')
L
disp('Matrik Segitiga Atas')
U
disp('Nilai X')
X=x_soln










