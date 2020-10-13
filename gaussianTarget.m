function value = gaussianTarget(x)  %%%%%%%%%%%%%%%%  % Focntion somme de trois gaussiennes permettant de tester le bon fonctionnement  % de l'algorithme de Metropolis Hastings sur d'autres fonctions cible  %  % Les paramètres de moyenne et d'écart type sont changeable  %%%%%%%%%%%%%%%%      value = (gaussianFunc(x, 0.2, 0.07) + gaussianFunc(x,0.7,0.05) + gaussianFunc(x,0.5,0.01))/3;
end
