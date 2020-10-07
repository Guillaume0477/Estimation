function x = MetroHast(T, a, b, sigq)
  x = zeros([T,1]);
  x(1) = 0.5;
  
  nbBins = 20;
  
  for k = 1:T-1
    
    xcand = Loi_de_proposition(x(k), sigq);
    
    alpha = min(1,cibleBeta(xcand, a, b)/cibleBeta(x(k), a, b));
    
    choice = rand();
    
    if choice < alpha
      x(k+1) = xcand;
    else 
      x(k+1) = x(k);
    end
    
  end

  x1 = -0.25:0.01:1.25;
  cible_beta_theo=x1.^(a-1) .* (1-x1).^(b-1) .* (0 < x1) .* (x1 < 1) * 1/beta(a,b);
  
  
  [histo,s] = hist(x,nbBins+1);
  histo = histo/(T*(s(2)-s(1)));
  
  
  crossCorr = xcorr(x,x);
  
  figure();
  plot(x)
  
  figure()
  plot(-T+1:T-1, crossCorr)
  
  figure();
  hold on
  bar(0:1/nbBins:1, histo);
  plot(x1,cible_beta_theo)
  
end
