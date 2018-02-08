function dist = distance(X1, X2)
    dist = X1-X2;
    dist = dist*dist';
    dist = dist^0.5;
end

    