function x_t_plus_1 = Loi_de_proposition(xt , sigq, loiProp, argsTarg)

  if nargin < 3 
    loiProp = 0;
    argsTarg = 0;
  elseif nargin < 4
    argsTarg = [0.5, 0.5];
  end

  ##xt
  ##sigq
  ##loiProp
  ##argsTarg


  N = randn();

  if loiProp == 1
    eps = 0.01;
  ##  log(cibleBeta(xt, argsTarg(1), argsTarg(2)))
  ##  log(cibleBeta(xt+eps, argsTarg(1), argsTarg(2)))
  ##  pilou = (log(cibleBeta(xt, argsTarg(1), argsTarg(2))) - log(cibleBeta(xt+eps, argsTarg(1), argsTarg(2))))
  ##  pilou / eps
    N = N + 0.5*(log(cibleBeta(xt+eps, argsTarg(1), argsTarg(2))) - log(cibleBeta(xt, argsTarg(1), argsTarg(2))))/eps;
  end

  x_t_plus_1 = xt + sigq*N;
end

