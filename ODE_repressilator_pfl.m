function dydt = ODE_repressilator_pfl(Time, y0, alpha, beta, alpha0, n, k)

    dydt = [alpha0 + alpha./(1.0 + y0(6).^n) - y0(1) + (k.*(alpha0 - y0(1)).*alpha)./(1.0 + y0(2).^n);
            beta.*(y0(1) - y0(2));
            alpha0 + alpha./(1.0 + y0(2).^n) - y0(3);
            beta.*(y0(3) - 0.19.*y0(4));
            alpha0 + alpha./(1.0 + y0(4).^n) - y0(5);
            beta.*(y0(5) - y0(6));
            ];
