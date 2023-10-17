function X = wildpoint(Xo, Const)
Xstd = std(Xo);
n = length(Xo);
Xor = Xo;
% Primeira etapa    
I1 = 3:(n - 2);
il1 = length(I1);
xso1 = [I1 - 2; I1 - 1;
I1; I1 + 1; I1 + 2];
xx1 = sort(Xo(xso1));
Xo(I1) = xx1(3, :);
% Segunda etapa    
I2 = 4:(n - 3);
il2 = length(I2);
xso2 = [I2 - 1; I2; I2 + 1];
xx2 = sort(Xo(xso2));
Xo(I2) = xx2(2, :);
% Comparar a série temporal original com a ordenada.    
Diferen = abs(Xo - Xor);
III = find(Diferen > Const * Xstd);
X(III) = Xo(III);
end
