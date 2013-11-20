function [freq, t, y] = simulate_repressilator_pfl(opt)
    % Set params
    default_params = struct('alpha', 300,...
                            'beta', 0.2,...
                            'alpha0', 0,...
                            'n', 2,...
                            'k', 1,...
                            'tspan', [0 2000],...
                            'y0', zeros(1, 6));

    if(nargin == 1)
        params = get_params(default_params, opt);
    else
        params = default_params;
    end

    % Run simulation
    [t, y] = ode45(@ODE_repressilator, params.tspan, params.y0, [], params.alpha, params.beta, params.alpha0, params.n, params.k);

    % Find oscillation frequency
    freq = freqfind(t, y, params.tspan(2));
end
