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

function dydt = ODE_IRMA(Time, x, alpha1, alpha2, alpha3, alpha4, alpha5,...
                         v1, v2, v3, v4, v5,...
                         k1, k2, k3, k4, k5, k6,...
                         h1, h2, h3, h4, h5, h6, h7,...
                         d1, d2, d3, d4, d5,...
                         gamma)

    dydt = [alpha1 + v1.*(k2.^h2)./(k2.^h2 + x(5).^h2) - d1.*x(1);

            alpha2 + v2.*(x(1).^h3)./(k3.^h3 + x(1).^h3) - d2.*x(2);

            alpha3 + v3.*(x(2).^h4)./(k4.^h4 + (x(2).^h4).*(1+x(4).^h7./gamma.^h7))...
                     + v5.*(x(3).^h6)./(k6.^h6 + x(3).^h6) - d3.*x(3);

            alpha4 + v4.*(x(3).^h5)./(k5.^h5 + x(3).^h5) - d4.*x(4);

            alpha5 + v5.*(x(3).^h6)./(k6.^h6 + x(3).^h6) - d5.*x(5);];
end