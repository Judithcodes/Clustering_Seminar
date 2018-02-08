function Clusters = NN(X)

[N m] = size(X);
for i = 1:N
    Clusters{i} = X(i,:);
end

K = input('Enter no. of clusters you want: ');
min_dist = 10^15;
dist_clust = [];

for i = 1:(N-K)
   L = length(Clusters)
   for j = 1:L
        for k = 1:L
            if (j ~= k) 
                for s = 1:size(Clusters{j},1)
                    for t = 1:size(Clusters{k},1)
                        dist_pt = distance(Clusters{j}(s,:),Clusters{k}(t,:));
                        dist_clust = [dist_clust; dist_pt];
                    end           
                end
                min_dist1 = max(dist_clust);%%%%
                dist_clust = [];
                if (min_dist1 < min_dist)
                    min_dist = min_dist1;
                    merge_clust = [j k];
                end
            end
        end
   end
    Clusters{merge_clust(1)} = [Clusters{merge_clust(1)}; Clusters{merge_clust(2)}];
    Clusters{merge_clust(2)} = {};
    Clusters =  Clusters(~cellfun('isempty',Clusters));
    min_dist = 10^15;
end
end
  
    
    

