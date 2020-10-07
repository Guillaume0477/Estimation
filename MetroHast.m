function x = MetroHast(T, a, b, sigq)  x = zeros([T,1]);  x(1) = 0.5;    for k = 1:T-1        xcand = Loi_de_proposition(x(k), sigq);        valueToComp = cibleBeta(xcand, a, b)/cibleBeta(x(k), a, b) * normpdf(x(k),0,1)/normpdf(xcand,0,1);              end      
endfunction
