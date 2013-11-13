function dydt = ODE_smolon(Time, y, sigma, tauy, gamma_x, gamma_y, alpha)

dydt = [(1 + y(1).^2 + alpha.*sigma.*y(1)^4)./((1 + y(1).^2 + sigma.*y(1).^4).*(1 + y(2).^4)) - gamma_x.*y(1);
       ((1 + y(1).^2 + alpha.*sigma.*y(1)^4)./((1 + y(1).^2 + sigma.*y(1).^4).*(1 + y(2).^4)) - gamma_y.*y(2))./tauy;
        ];