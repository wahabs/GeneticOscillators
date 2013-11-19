function [freq, t, y] = simulate_IRMA(opt)
    % Set params
    default_params = struct('alpha', [0, 1.49e-4, 3e-3, 7.4e-4, 6.1e-4],...
                            'v', [.04, .026, .02, .014, .018],...
                            'k', [0, .00035, .037, .01, 1.884, .0477],...
                            'h', [0, 1, 4, 1, 4, 4, 4],...
                            'tspan', [0 2000],...
                            'gamma', 0.6,...
                            'd', [.022, .047, .421, .098, .05]);

    if(nargin == 1)
        params = get_params(default_params, opt);
    else
        params = default_params;
    end

    % Run simulation
    [t, y] = ode45(@ODE_IRMA, params.tspan, params.alpha, [], params.v, params.k, params.h, params.gamma, params.d);

    % Find oscillation frequency
    freq = freqfind(t, y, params.tspan(2));
end