function z = calFac(x)
    % Fungsi untuk menghitung x! (faktorial dari x)
    % dimana z adalah hasil faktorial dari x
    % 
    % http://github.com/miftanurfarid
    y = x;
    while y > 1
        x = x * (y - 1);
        y = y - 1;
    end
    z = x;
end