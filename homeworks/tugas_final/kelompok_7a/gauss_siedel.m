
	
%metode gauss-siedel MATLAB
%kelompok 7 kelas A
%Tugas Besar Metode Numerik dan Komputasi
 
function x = gauss_siedel( A ,B )
disp ( 'masukkan persamaan linear dalam bentuk  AX=B')
 
%memasukkan matrix a
 
A = input ( 'masukkan matrix A dalam bentuk matrix persegi :   \n')
% cek input-an matriks
 
[na , ma ] = size (A);
if na ~= ma
    disp('ERROR: Matrix A harus dalam bentuk matrix persegi')
    return
end
 
% masukkan matrix B
 
B = input ( 'masukan matrix B, harus dalam matrix kolom :   ')
% cek matrix kolom b
 
[nb , mb ] = size (B);
if nb ~= na || mb~=1
   disp( 'ERROR: Matrix B harus dalam bentuk matrix kolom')
   return
end
 
% proses memisahkan matrix A menjadi matriks segitiga atas dan bawah
 
% A = D + L + U
 
D = diag(diag(A));
L = tril(A)- D;
U = triu(A)- D
 
% cek apakah konvergen
 
e= max(eig(-inv(D+L)*(U)));
if abs(e) >= 1
    disp ('karena modulus  Eigen value terbesar dari itersi matriks tidak kurang dari 1') 
    disp ('maka tidak konvergen.')
    return
end
 
% initial guess for X..?
 
% default guess is [ 1 1 .... 1]
 
r = input ( 'Any initial guess for X? (y/n):   ','s');
switch r 
    case 'y'
        % asking for initial guess
    X0 = input('Enter initial guess for X :\n')
        % check for initial guess
    [nx, mx] = size(X0);
        if nx ~= na || mx ~= 1
        disp( 'ERROR: cek input')
        return
    end
    otherwise
    X0 = ones(na,1);
end
 
% error yang dibolehkan pada jawaban akhir
 
t = input ( 'masukan nilai error yg diperbolehkan pada jawaban akhir:  ');
tol = t*ones(na,1);
k= 1;
 
X( : , 1 ) = X0;
err= 1000000000*rand(na,1);% initial error assumption for looping
while sum(abs(err) >= tol) ~= zeros(na,1)
    X ( : ,k+ 1 ) = -inv(D+L)*(U)*X( : ,k) + inv(D+L)*B;% rumus Gauss-Seidel 
    err = X( :,k+1) - X( :, k);% mencari error
    k = k + 1;
    
end
 
fprintf ('jawaban akhir yang didapat setelah %g iterasi adalah  \n', k)
X( : ,k)