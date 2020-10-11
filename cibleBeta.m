function value = cibleBeta(x,a,b)      value = x.^(a-1) .* (1-x).^(b-1) .* (0 < x) .* (x < 1) * 1/beta(a,b);    
end
