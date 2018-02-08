function Clusters = DBSCAN(X, min_pts, radius)

    [N m] = size(X);
    Clusters = {};
    cluster_count = 0;
    pts_visited = zeros(N,1);
    pts_c = zeros(N,1);  
    
    for n = 1:N
        if (pts_visited(n) == 0)
            pts_visited(n) = 1;
            nhbr_pts = neighbour(X, X(n,:), radius);
            if (length(nhbr_pts) >= min_pts)
                cluster_count = cluster_count + 1;
                Cluster_points = nhbr_pts;
                pts_c(n) = cluster_count;
                Clusters{cluster_count} = n;
                for i = 1:length(Cluster_points)
                            p = Cluster_points(i);
                            if (pts_visited(p) == 0)
                                pts_visited(p) = 1;
                                nhbr_pts = neighbour(X, X(p,:), radius);
                                if (length(nhbr_pts) >= min_pts)
                                    Cluster_points = [Cluster_points nhbr_pts];
                                end
                            end
                            if (pts_c(p) == 0)
                               pts_c(p) = cluster_count;
                               Clusters{cluster_count} = [Clusters{cluster_count} p];
                            end      
                end    
            else
                pts_c(n) = 0;
            end  
        end          
    end
    
  %{  
    cluster_centers = [];
    sum = zeros(1,m);
    for i = 1:cluster_count
        for j = 1:length(Clusters{i})
            sum = sum + X(Clusters{i}(j),:);
        end
        cluster_centers = [cluster_centers;sum/length(Clusters{i})];
        sum = zeros(1,m);    
    end
  
    noise = [];
    for i= 1:length(pts_c)
        if(pts_c(i) == 0)
            noise = [noise i];
        end
    end
    
    dist1 = 100000;
    for i = 1:length(noise)
        for j = 1:cluster_count
            dist = norm(X(noise(i),:) - cluster_centers(j,:));
            if dist < dist1
                pts_c(noise(i)) = j;
                dist = dist1;
            end
        end
        dist1 = 100000;
    end  
    pts = [];
    
    for i = 1:cluster_count
        for j = 1:length(pts_c)
            if (pts_c(j) == i)
                pts = [pts j];
            end
        end
        Clusters{i} = pts;
        pts = [];
    end 
    %}
end

    
            