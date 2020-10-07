function val = gaussianFunc(x, mu, sigma)    val = 1/(sigma*sqrt(2*pi)) * exp(-(x-mu)*(x-mu)/(2*sigma*sigma));    
endfunction
