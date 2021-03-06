function [freq, t, y] = simulate_metabolator(opt)
    % Set params
    default_params = struct('k1', 80,...
                            'k2', 0.8,...
                            'k3', 0.01,...
                            'Km1', 0.06,...
                            'Km2', 0.1,...
                            'S0', 1,... %varied in Fung
                            'kTCA', 10,...
                            'kAckf', 1,...
                            'kAckr', 1,...
                            'C', 100,...
                            'Hp', 10^-7,...
                            'Keq', 10^-4.5,...
                            'HOAcE', 0,... %varied in Fung
                            'a0', 0,...
                            'a1', 0.1,...
                            'a2', 2,... %varied in Fung
                            'a3', 2,... %varied in Fung
                            'Kg1', 10,... %typo in Fung
                            'Kg2', 10,...
                            'Kg3', 0.001,...
                            'kd', 0.06,...
                            'n', 2,...
                            'tspan', [0 2000],...
                            'y0', zeros(1,7));

    if(nargin == 1)
        params = get_params(default_params, opt);
    else
        params = default_params;
    end

    % Run simulation
    [t, y] = ode45(@ODE_metabolator, params.tspan, params.y0, [], ...
        params.k1, params.k2, params.k3, params.Km1, params.Km2, ...
        params.S0, params.kTCA, params.kAckf, params.kAckr, params.C, ...
        params.Hp, params.Keq, params.HOAcE, params.a0, params.a1, ...
        params.a2, params.a3, params.Kg1, params.Kg2, params.Kg3, ...
        params.kd, params.n);

    % Find oscillation frequency
    freq = freqfind(t, y, params.tspan(2));
end