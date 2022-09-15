function c = forwardSubstitution(L,P,b)
[pr,pc] = size(P);
[lr,lc] = size(L);
[br,bc] = size(b);
if ~(pc == br & lr == pr & lc == pc & bc == 1)
    c = [];
else
    Pb = P*b;
    c = [];
    for i = 1:length(Pb)
        if i == 1
            c(i) = Pb(i);
        else
            for j = i:length(Pb)
                Pb(j) = Pb(j) - c(i-1)*L(j,i-1);
            end
            c(i) = Pb(i);
        end
    end
end
c = c'
end