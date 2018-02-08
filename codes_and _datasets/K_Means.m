function Clusters = K_Means(X)

Cluster_count = input('Enter the no. of clusters you want: ');
[N m] = size(X);
centroids_new = X(randperm(N,Cluster_count),:);
pts_c = zeros(N,1);
dist1 = 1000000;
centroid_diff = 1;

while (centroid_diff > 10^-5)
    %calculating distance of points from centroids
    for i = 1:N
        for j = 1:Cluster_count
            dist = distance(X(i,:),centroids_new(j,:));
            if dist < dist1
                pts_c(i) = j;
                dist1 = dist;
            end
        end
        dist1 = 10000000;
    end
    %storing cluster points
    for i =1:Cluster_count
        p = (pts_c == i);
        y = X(p,:);
        scatter(y(:,1),y(:,2), 'filled')
        Clusters{i} = y;
        hold on;
    end
    %scatter(centroids_new(:,1),centroids_new(:,2),100,'filled');  
    centroids_old = centroids_new;
    centroids_new = [];
    
    %updating centroids
    for i = 1:Cluster_count
        p = (pts_c == i);
        y = X(p,:);
        centroids_new = [centroids_new;mean(y)];
    end
    
    %calculating displacement of centroids
    centroid_diff = 0;
    for i = 1:Cluster_count
        centroid_diff = centroid_diff + distance(centroids_new(i,:), centroids_old(i,:));
    end
   % centroid_diff
    pause;
end
hold off;
end
