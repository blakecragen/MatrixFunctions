function d = myDeterminant(A)
[r,c] = size(A);
if r ~= c
    d = [];
else
    [L,U,P] = luDecomposition(A);
    P = P';
    [r,c] = size(L);
    diagL = L(1:r+1:min(r,c)*r);
    diagU = U(1:r+1:min(r,c)*r);
    det1 = prod(diagL);
    det2 = prod(diagU);
    det3 = findDetP(P);
    d = det1*det2*det3;
end
end

function det3 = findDetP(P)
[r,c] = size(P);
if r == 1
    det3 = P;
else
    firstCol = P(:,1);
    rest = P(2:end,:);
    where1 = firstCol == 1;
    inds = 1:r;
    row = inds(where1);
    rest(:,where1) = [];
    if mod(row + 1,2) == 1
        det3 = -1*findDetP(rest);
    else
        det3 = findDetP(rest);
    end
end
end