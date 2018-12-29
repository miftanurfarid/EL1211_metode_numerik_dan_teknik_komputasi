disp('Metode Invers Dan Determinan Matriks')
A = input('Silahkan Masukkan Matriks A (3x3) : ')
k = input('Silahkan Masukkan Koefisien A (3x1): ')
B = det(A);
disp('Determinan dari matriks A adalah', B)
C = inv(A);
disp('Invers dari matriks A adalah', C)
D = inv(A)*k
disp('Penyelesaian persamaan linear serentak dari matriks A adalah',D)