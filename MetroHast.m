function x = MetroHast(T, a, b, sigq, loiProp)
  x = zeros([T,1]);
  x(1) = 0.5;
  
  nbBins = 30;
  
  accept = 0;
  
  for k = 1:T-1
    
    xcand = Loi_de_proposition(x(k), sigq, loiProp, [a,b]);
##    getProbaFromProp(x(k), xcand, sigq, loiProp, [a,b])
##    getProbaFromProp(xcand, x(k), sigq,  loiProp, [a,b])
    
    alpha = min(1,cibleBeta(xcand, a, b)/cibleBeta(x(k), a, b) * getProbaFromProp(x(k), xcand, sigq, loiProp, [a,b]) / getProbaFromProp(xcand, x(k), sigq,  loiProp, [a,b]));
    
    choice = rand();
    
    if choice < alpha
      x(k+1) = xcand;
      accept = accept + 1;
    else 
      x(k+1) = x(k);
    end
    
  end

  
  x1 = -0.25:0.01:1.25;
  cible_beta_theo= cibleBeta(x1, a, b); %x1.^(a-1) .* (1-x1).^(b-1) .* (0 < x1) .* (x1 < 1) * 1/beta(a,b);
  
  figure()
  subplot(131)
  plot(x1,cible_beta_theo)
  title('Fonction beta (fonction cible)')
  subplot(132)
  plot(x1,log((cible_beta_theo)))
  title('Logarithme de la fonction cible')
  subplot(133)
  plot(x1, gradient(log(cible_beta_theo), 0.01))
  title('Gradient du logarithme de la fonction cible')
  
  [histo,s] = hist(x,nbBins+1);
  histo = histo/(T*(s(2)-s(1)));
  
  
  crossCorr = xcorr(x, "unbiased");
  
  figure();
  subplot(211)
  plot(x)
  title(["Display the successive x value with acceptation rate = ", num2str(accept/T * 100), '%'])
  
  subplot(224)  
  plot(-T+1:T-1, crossCorr)
  title('Auto-correlation of x-serie')
  
  subplot(223)
  plot(x1,cible_beta_theo)
  hold on
  bar(0:1/nbBins:1, histo);
  title('Comparison between the values taken by x(t) and the true target function')
  
end
