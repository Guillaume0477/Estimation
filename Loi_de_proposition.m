function x_t_plus_1 = Loi_de_proposition(xt , sigq, loiProp, argsTarg, loiTarg)
  %%%%%%%%%%%%%%
  % Fonction permettant de générer une valeur candidate pour l'algorithme de 
  % Metropolis Hastings en fonction de la loi choisie
  %%%%%%%%%%%%%%%
  
  %Définition des paramètres manquants
  if nargin < 3 
    loiProp = 0;
    argsTarg = 0;
  elseif nargin < 4
    argsTarg = [0.5, 0.5];
  end
  
  %Obtention d'une valeur suivant une distributin gaussienne
  N = randn();
  
  %Calcul de la valeur candidate en fonction de la marche aléatoire de Langevin (non fonctionnel)
  if loiProp == 1
    eps = 0.01;
    N = N + 0.5*(log(loiTarg(xt+eps, argsTarg(1), argsTarg(2))+0.0001) - log(loiTarg(xt, argsTarg(1), argsTarg(2))+0.0001))/eps;
  end

  %Assignation de la valeur candidate
  x_t_plus_1 = xt + sigq*N;
end

