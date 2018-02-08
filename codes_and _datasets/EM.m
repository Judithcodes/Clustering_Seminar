function Clusters = EM(X)
    K = input('Enter the no. of gaussians: ');
    e = 10^-4;
    % load('seeds.mat') %%%%%%%%%%%%%%%
    gamma = gamrnd(ones(size(X,1), K), 1);
    gamma = gamma ./ repmat(sum(gamma, 2),1 , K);
    [m labels] = max(gamma, [], 2);
    Clusters =  plot_graph(K, labels, X);
    
    ll = -inf;
    [mu, sigma, lambda] = M_step(X, gamma);
    nll = log_likelihood(X, mu, sigma, lambda);
    disp(['the log likelihood = ' num2str(nll);]);
    
    while (abs(ll - nll) >= e)
        ll = nll;
        gamma = E_step(X, lambda, mu, sigma);
        [mu, sigma, lambda] = M_step(X, gamma);
        nll = log_likelihood(X, mu, sigma, lambda); 
        disp(['the log likelihood = ' num2str(nll);]);
        [m labels] = max(gamma, [], 2);
        Clusters = plot_graph(K, labels, X);     
    end
end
    
    
    
    
        
    
            
