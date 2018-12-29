function s = calS(xs, x0, x1)
    % Fungsi untuk menghitung nilai s dimana
    % s adalah hasil bagi antara selisih Xs dengan X0
    % terhadap X1 - X0
    % 
    % s = (xs - x0) / (x1 - x0)
    % 
    % xs adalah titik yang dicari interpolasi
    % f(x)-nya
    % x0 adalah nilai variabel x pada n = 0
    % x1 adalah nilai variabel x pada n = 1.
    % 

    s = (xs - x0) / (x1 - x0);

end