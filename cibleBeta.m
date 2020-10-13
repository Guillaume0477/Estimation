function value = cibleBeta(x,a,b)  %%%%%%%%%%%%%%%%%%%  % Fonction permettant de retourner la valeur de la fonction BETA(x) avec   % pour paramètres internes a et b  %%%%%%%%%%%%%%%%%%%    value = x.^(a-1) .* (1-x).^(b-1) .* (0 < x) .* (x < 1) * 1/beta(a,b);    
end
