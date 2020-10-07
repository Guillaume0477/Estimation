function x_t_plus_1 = Loi_de_proposition(xt , sigq)


mu=0;
sigma=1;

N = normrnd(mu,sigma)

x_t_plus_1 = xt + sigq*N

end

