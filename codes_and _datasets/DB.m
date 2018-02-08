function [idx noise] = DB(X, min_pts, radius)

    [N m] = size(X);
    Cluster_count = 0;
    idx = zeros(N,1); 
    
    visited = false(N,1);
    noise = false(N,1);
    
    for i=1:N
        if ~visited(i)
            visited(i) = true;
            
            nhbrs =  neighbour(X, i, radius);
            
            if(length(nhbrs)<min_pts)
                noise(i) = true;
            else
                Cluster_count = Cluster_count + 1;
                ExpandCluster(i, nhbrs, Cluster_count);
            end
        end
    end
    
    function ExpandCluster(i, nhbrs, C)
        idx(i) = C;
        k = 1;
        while true
            j = nhbrs(k);
            if ~visited(j)
                visited(j) = true;
                
                nhbrs2 =  neighbour(X, j, radius);
                if(length(nhbrs2)>=min_pts)
                    nhbrs = [nhbrs nhbrs2];
                end
            end
            
            if idx(j) == 0;
                idx(j) = C;
            end
            k = k+1;
            
            if (k > size(nhbrs,1))
                break;
            end
        end
    end
end


    