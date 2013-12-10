function dydt = ODE_metabolator_mod(Time, y0, k1, k2, k3, Km1, Km2, S0, kTCA, kAckf, kAckr, C, Hp, Keq, HOAcE, a0, a1, a2, a3, Kg1, Kg2, Kg3, kd, n, delta_max, D, D_half)

    delta = 1 - (delta_max - 1)./(1 + exp(D_half)) + (delta_max - 1)./(1 + exp(-(D-D_half)));

    dydt = [((k2.*y0(7).*y0(3))./(Km2 + y0(3)) - (k1.*y0(6).*y0(1))./(Km1 + y0(1)) + S0 - kTCA.*y0(1));
            ((k1.*y0(6).*y0(1))./(Km1 + y0(1)) - (kAckf.*y0(2) - kAckr.*y0(3)));
            ((kAckf.*y0(2) - kAckr.*y0(3)) - C.*(y0(2).*Hp - Keq.*y0(3)) - (k2.*y0(7).*y0(3))./(Km2 + y0(3)));
            (C.*(y0(2).*Hp - Keq.*y0(3)) - k3.*(y0(4) - HOAcE));
            ((a1.*(y0(2)*delta./Kg1).^n)./(1+(y0(2)*delta./Kg1).^n)+a0 - kd.*y0(5));
            ((a3)./(1+(y0(5)./Kg3).^n)+a0 - kd.*y0(6));
            ((a2.*(y0(2)./Kg2).^n)./(1+(y0(2)./Kg2).^n)+a0 - kd.*y0(7));
            ];
