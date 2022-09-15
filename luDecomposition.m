function [L,U,P] = luDecomposition(A)
[rows,cols] = size(A);
A2 = A;
if rows ~= cols
    L = [];
    U = [];
    P = [];
else
    L = eye(rows,rows);
    U = zeros(rows,rows);
    P = zeros(rows,rows);
    for i = 1:rows
        if i == 1
            [A,rowReplaced] = findPivot2(A,i);
        else
            [A,rowReplaced] = findPivot(A,i);
        end
        
        for j = (i+1):rows
            timesAdded = A(j,i)/A(i,i);
            A(j,:) = A(j,:) - A(i,:)/A(i,i)*A(j,i);
            L(j,i) = timesAdded;
        end
    end
    U = A;
    P = findP(L,U,A2)
end
end


function [A,toRow] = findPivot(A,pivotFinding) %A,2
if A(pivotFinding,pivotFinding) == 0
    [rows,cols] = size(A);
    colToSwitch = A(:,pivotFinding);%[0;1;2]
    colToSwitch(1:pivotFinding-1) = [];%[0;1;2]
    [~,ind] = max(colToSwitch); %3
    [~,inds] = sort(colToSwitch,'d');
    topPart = A(1:pivotFinding-1,:);
    bottomPart = A(pivotFinding:end,:);
    bottomPart = bottomPart(inds,:);
    A = [topPart; bottomPart];
    toRow = ind + pivotFinding - 1;
else
    toRow = pivotFinding;
end
end

function [A,toRow] = findPivot2(A,pivotFinding) %A,2
[rows,cols] = size(A);
colToSwitch = A(:,pivotFinding);%[0;1;2]
colToSwitch(1:pivotFinding-1) = [];%[0;1;2]
[~,ind] = max(colToSwitch); %3
[~,inds] = sort(colToSwitch,'d');
topPart = A(1:pivotFinding-1,:);
bottomPart = A(pivotFinding:end,:);
bottomPart = bottomPart(inds,:);
A = [topPart; bottomPart];
toRow = ind + pivotFinding - 1;
end

function P = findP(L,U,A)
Acomp = round(L*U,2);
A = round(A,2);
[rows,cols] = size(L);
P = zeros(rows,rows);
for i = 1:rows
    currentRow = Acomp(i,:);
    for j = 1:rows
        if all(A(j,:) == currentRow)
            P(i,j) = 1;
        end
    end
end
end