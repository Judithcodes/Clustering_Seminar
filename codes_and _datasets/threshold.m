function sum = threshold(centroid, centroid1)

sum = 0;

for i = 1:size(centroid,1)
    sum = sum + norm(centroid(i,:) - centroid1(i,:));
end
end
