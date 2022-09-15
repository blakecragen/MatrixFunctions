function B = myInverse(A)
[r,c] = size(A);
if ~(r == c)
    B = [];
else
    [L,U,P] = luDecomposition(A);
    B = [];
    I = eye(r,r);
    for i = I
        c = forwardSubstitution(L,P,i);
        x = backSubstitution(U,c);
        B = [B x];
    end
end
end