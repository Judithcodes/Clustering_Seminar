function gamma = E_step(data, lambda, mu, sigma)
    K = size(mu, 1);
    N = size(data, 1);
    gamma = zeros(N,K);
    X = data;
    
    
    for i = 1:N
        for j = 1:K
            denom = 0;
            for k = 1:K
                denom = denom + lambda(k)*mvn(X(i,:), mu(k,:), sigma{k});
            end
            gamma(i, j) = (lambda(j)*mvn(X(i,:), mu(j,:), sigma{j}))/denom;
        end
    end
end

    
                