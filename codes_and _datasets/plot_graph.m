function Clusters = plot_graph(K, labels, X)
    Clusters = cell(1,K);
    for i =1:K
        p = (labels == i);
        y = X(p,:);
        scatter(y(:,1),y(:,2))
        Clusters{i} = y;
        hold on;
    end
    %disp('Programme paused');
    %pause;
    hold off;
end