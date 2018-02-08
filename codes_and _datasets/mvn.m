function y = mvn(x, mu, sigma)
    d = size (x,2);
    y = ((2*pi)^(-d/2))*(det(sigma)^(-1/2)) *exp(-0.5*(x-mu)*inv(sigma)*(x-mu)');
end

    