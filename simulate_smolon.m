function freq = simulate_smolon(opt)
    % Set params
    default_params = struct('sigma', 1.5,...
                            'tau_y', 10000,...
                            'gamma_x', 0.105,...
                            'gamma_y', 0.036,...
                            'alpha', 11,...
                            'tspan', [0 400000],...
                            'y0', zeros(1, 2));

    if(nargin == 1)
        params = get_params(default_params, opt);
    else
        params = default_params;
    end

    % Run simulation
    [t, y] = ode45(@ODE_smolon, params.tspan, params.y0, [], params.sigma, params.tau_y, params.gamma_x, params.gamma_y, params.alpha);

    % Find oscillation frequency
    freq = freqfind(t, y, params.tspan(2));
end
