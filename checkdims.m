function checkdims(A,siz,str)
if any(size(A) ~= siz)
    error(str)
end