% Kelompok 1: Penyelesaian akar-akar persamaan karakteristik
% 
% f(x) = 2 - 5x - sin(x) + cos(10x)
% 
% Dalam radian.
% 
% 1. Metode Tabulasi
% 2. Metode Regula-Falsi
% 3. Metode Iterasi Bentuk x = g(x)
% 

% Solusi 1

% kondisi awal
fx0 = 0;
fx1 = 0;

while fx0*fx1 >= 0
    x0 = input('x0 = ');
    x1 = input('x1 = ');
    fx0 = calFx(x0);
    fx1 = calFx(x1);

    if fx0*fx1 >= 0
        fprintf('f(x0)*f(x1) = %i\n', fx0 * fx1)
        fprintf('X0 dan X1 tidak memenuhi syarat.\n')
    else
        fprintf('f(x0)*f(x1) = %i\n', fx0 * fx1)
        fprintf('X0 dan X1 memenuhi syarat.\n')
    end

end

% generate tabel
fx = 1
% for idy = 1:3
while abs(fx) > 1*10e-7
    x = linspace(x0,x1,10)
    for idx = 1:length(x)-1
        x0 = x(idx);
        x1 = x(idx + 1);
        if (calFx(x0) * calFx(x1)) < 0
            fprintf('Solusi ada di antara %i dan %i \n', x0,x1);
            break;
        end
    end
    fx = min(calFx(x0), calFx(x1))
end

if abs(calFx(x0)) < abs(calFx(x1))
    fprintf('Akar persamaannya adalah %f dengan error %i\n',x0,abs(calFx(x0)))
else
    fprintf('Akar persamaannya adalah %f dengan error %i\n',x1,abs(calFx(x1)))
end


function fx = calFx(x)
    fx = 2 - 5*x - sin(x) + cos(10*x);
end