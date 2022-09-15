function x = backSubstitution(U,c)
[ur,uc] = size(U);
[cr,cc] = size(c);
if ~(ur == cr && cc == 1)
    x = [];
else
    x = [];
    for i = length(U):-1:1
        if i == length(U)
            x(i) = c(i)/U(i,i);
        else
            for j = i:-1:1
                c(j) = c(j) - x(i+1)*U(j,i+1)
            end
            x(i) = c(i)/U(i,i)
            %{
            U = 
            [2  4  | 1]
            [0  1  | -2.5]
            %}
        end
    end
    x = x';
end
end