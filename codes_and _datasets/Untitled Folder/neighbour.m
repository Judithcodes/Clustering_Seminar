function [nhbr] = neighbour(X, i, radius)
    D = pdist2(X,X);
    nhbr = find(D(i,:)<=radius);
end