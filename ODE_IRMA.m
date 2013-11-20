% IRMA Oscillator with automatic feedback loop, as related in Marucci 2009,
% "How to Turn a Genetic Circuit into a Synthetic Tunable Oscillator, or a
% Bistable Switch." The specific model is referred to as Scenario 3 (Fig. 1D)
% in the paper.
% 
% x1 = [Cbf1]
% x2 = [Gal4]
% x3 = [Swi5]
% x4 = [Gal80]
% x5 = [Ash1]
% 
% For each concentration variable x_i, the respective parameters are
% alpha: basal synthesis rate
% v: Maximum synthesis rate
% k: Michaelis-Menton Constant
% h: Effective Hill Coefficient or Cooperativity
% d: Degradation Rate
% Gamma: Affinity Constant for the positive feedback loop (only used for
%        x_3)



function dydt = ODE_IRMA(Time, x, alpha, v, k, h, gamma, d)

dydt = [alpha(1) + v(1).*(k(2).^h(2))./(k(2).^h(2) + x(5).^h(2)) - d(1).*x(1);
    
        alpha(2) + v(2).*(x(1).^h(3))./(k(3).^h(3) + x(1).^h(3)) - d(2).*x(2);
        
        alpha(3) + v(3).*(x(2).^h(4))./(k(4).^h(4) + (x(2).^h(4)).*(1+x(4).^h(7)./gamma.^h(7)))...
                 + v(5).*(x(3).^h(6))./(k(6).^h(6) + x(3).^h(6)) - d(3).*x(3);
                 
        alpha(4) + v(4).*(x(3).^h(5))./(k(5).^h(5) + x(3).^h(5)) - d(4).*x(4);
        
        alpha(5) + v(5).*(x(3).^h(6))./(k(6).^h(6) + x(3).^h(6)) - d(5).*x(5);

];