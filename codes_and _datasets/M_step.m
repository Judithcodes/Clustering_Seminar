function [mu, sigma, lambda] = M_step(data, gamma)
    K = size(gamma, 2);
    [N d] = size(data);
    mu = zeros(K, d);
    sigma = cell(1,K);
    X = data;
    
    
    for i = 1:K
        sum = 0;
        sum1 = 0;
        for j = 1:N
            sum = sum + gamma(j,i);
            sum1 = sum1 + gamma(j,i)*X(j,:);
        end
        lambda(i) = sum;
        mu(i,:) = sum1/sum;
    end
    
    for i = 1:K
        sum = 0;
        sum1 = 0;
        for j = 1:N
            t = (X(j,:) - mu(i,:));
            sum = sum + gamma(j,i);
            sum1 = sum1 + gamma(j,i)*(t'*t);
        end
        sigma{i} = sum1/sum;
    end
end

    
        
        
    
    
            
    