function dydt = ODE_goodwin(Time, y0, lag, K, gamma, n, C0)
    dydt = [K./(1+lag./C0).^n - gamma.*y0(1)];
