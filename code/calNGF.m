function fxs = calNGF(xs, x, fx)
    % Fungsi untuk mencari nilai interpolasi fxs
    % dari 
    % menggunakan metode Newton Gregory Forward
    % 
    % s adalah
    % 
    % 
    f = fx(1,1);    % f0
    for idx = 2:pol
        if idx == 2
            f = f + ( s * fx(1,idx) / calFac1(idx-1) );
            sn = s;
        else
            sn = sn * (s - (idx - 2));
            f = f + ( sn * fx(1,idx) / calFac1(idx-1) );
        end
    end
    fxs = f;
end