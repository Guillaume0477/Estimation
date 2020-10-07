function value = cibleBeta(x,a,b)      value = x^(a-1) * (1-x)^(b-1) * (0 < x < 1) * gamma(a+b)/(gamma(a)*gamma(b));    
endfunction
