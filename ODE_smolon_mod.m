function dydt = ODE_smolon_mod(Time, y, sigma, tau_y, gamma_x, gamma_y, alpha, delta_max, D, D_half)

    delta = 1 - (delta_max - 1)./(1 + exp(D_half)) + (delta_max - 1)./(1 + exp(-(D-D_half)));

    dydt = [(1 + y(1).^2 + delta*alpha.*sigma.*y(1)^4)./((1 + y(1).^2 + sigma.*y(1).^4).*(1 + y(2).^4)) - gamma_x.*y(1);
            ((1 + y(1).^2 + delta*alpha.*sigma.*y(1)^4)./((1 + y(1).^2 + sigma.*y(1).^4).*(1 + y(2).^4)) - gamma_y.*y(2))./tau_y;
           ];
