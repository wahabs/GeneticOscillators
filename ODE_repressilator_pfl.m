function dydt = ODE_repressilator_pfl(alpha, beta, alpha0, n, k)

    dydt = [alpha0 + alpha./(1.0 + y(6).^n) - y(1) + (k.*(alpha0 - y(1)).*alpha)./(1.0 + y(2).^n);
            beta.*(y(1) - y(2));
            alpha0 + alpha./(1.0 + y(2).^n) - y(3);
            beta.*(y(3) - 0.19.*y(4));
            alpha0 + alpha./(1.0 + y(4).^n) - y(5);
            beta.*(y(5) - y(6));
            ];
