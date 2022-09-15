function x = solveLinearSystem(A,b)
%PA = LU
%Ux = c
%Lc = Pb
[L,U,P] = luDecomposition(A);
y = forwardSubstitution(L,P,b);
x = backSubstitution(U,y);
end