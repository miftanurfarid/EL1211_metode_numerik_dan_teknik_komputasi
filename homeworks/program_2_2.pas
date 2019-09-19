procedure HitungEpsilonMesin1(eps);
{ Prosedur untuk menemukan epsilon mesin
    Keadaan Awal : sembarang
    Keadaan Akhir: eps berisi harga epsilon mesin
    }
begin
    eps:=1;
    while eps + 1 > 1 do
        eps:=eps/2;
    {eps + 1 < 1}
    
    eps:=2*eps; {nilai epsilon mesin}
end;