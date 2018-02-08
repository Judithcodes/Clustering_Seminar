function ll = log_likelihood(data, mu, sigma, lambda)
    
    N = size(data, 1);
    K = size(mu, 1);
    X = data; 
    ll = 0;
    
    for i = 1:N
        sum = 0;   
        for j = 1:K
            sum = sum + lambda(j)*mvn(X(i,:), mu(j,:), sigma{j});
        end
        ll = ll + log(sum);
    end
end

        
    