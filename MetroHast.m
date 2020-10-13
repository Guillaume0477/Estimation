function x = MetroHast(T, sigq, loiProp, loiTarg, a, b)
  %%%%%%%%%%%%%%%%%%%%%
  % Fonction permettant de mettre en place l'algorithme de Metropolis Hastings
  % à partir d'une loi cible loiTarg et d'une loi de proposition loiProp 
  % générant une marche aléatoire. Les paramètres T et sigq sont propres à 
  % l'algorithme, respectivement le nombre d'échantillons de la série et le pas
  % maximal d'un échantillon à l'autre. 
  %
  % Les variables a et b ne sont utiles que lorsque l'utilisation de la loi BETA
  % est envisagée. 
  
  
  
  %Initialisation de la série
  x = zeros([T,1]);
  x(1) = 0.5;
  %Choix du nombre de bins dans l'histogramme
  nbBins = 60;
  %Nombre de valeurs candidate acceptées
  accept = 0;
  
  %Début de l'algorithme
  for k = 1:T-1
    %Création d'un candidat en fonction de la loi de proposition choisie
    xcand = Loi_de_proposition(x(k), sigq, loiProp, [a,b], loiTarg);
    %Calcul du rapport d'acceptation-rejet
    alpha = min(1,loiTarg(xcand, a, b)/(loiTarg(x(k), a, b)+0.0001) * getProbaFromProp(x(k), xcand, sigq, loiProp, [a,b], loiTarg) / (getProbaFromProp(xcand, x(k), sigq,  loiProp, [a,b], loiTarg)+0.0001));
    %Variable permettant de choisir si le candidat est conservé ou non
    choice = rand();
    
    %Conservation du candidat ou rejet en fonctin du rapport d'acceptation-rejet
    if choice < alpha
      x(k+1) = xcand;
      accept = accept + 1;
    else 
      x(k+1) = x(k);
    end
    
  end

  %Génération de la loi cible théorique
  x1 = -0.25:0.01:1.25;
  cible_beta_theo= loiTarg(x1, a, b); %x1.^(a-1) .* (1-x1).^(b-1) .* (0 < x1) .* (x1 < 1) * 1/beta(a,b);
  
  %Création de l'histogramme de la série résultante
  [histo,s] = hist(x,nbBins+1);
  histo = histo/(T*(s(2)-s(1)));
  
  %Calcul de l'auto-corrélation de la série
  crossCorr = xcorr(x, "unbiased");
  
  %Visualisation
  figure();
  %Visualisation de la série x(t)
  subplot(211)
  plot(x)
  title(["Display the successive x value with acceptation rate = ", num2str(accept/T * 100), '%'])
  %Visualisation de la fonction d'autocorrélation
  subplot(224)  
  plot(-T+1:T-1, crossCorr)
  title('Auto-correlation of x-serie')
  %Comparaison entre l'histogramme de la série construite et la fonction cible théorique
  subplot(223)
  hold on
  bar(s, histo);
  plot(x1,cible_beta_theo)
  title('Comparison between the values taken by x(t) and the true target function')
  
end
