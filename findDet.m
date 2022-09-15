function det = findDet(arr)
r = length(arr);
det = 0;
if r == 1
    det = arr;
else
    myRow = arr(1,:);
    for i = 1:length(myRow)
        newArr = [arr(2:end,1:i-1) arr(2:end,i+1:end)];
        det = (-1)^(i+1).*findDet(arr(2:end,2:end)) + det;
    end
end
end