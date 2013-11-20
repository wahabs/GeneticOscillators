function [freq, t, y] = simulate_goodwin(opt)
    default_params = struct('K', 1,... % Unrepressed production rate: unlisted, assumed in molec/min
                            'gamma', 1080,... % Degradation rate: listed in molec/min
                            'n', 2,... % Hill coefficient
                            'C0', 5,... % Affinity constant
                            'lag', 1,...
                            'tspan', [0 3],...
                            'y0', zeros(1, 2));

    if(nargin == 1)
        params = get_params(default_params, opt);
    else
        params = default_params;
    end
    
    % Run simulation
    sol = dde23(@ODE_goodwin, params.lag, params.y0, params.tspan, [], params.K,...
                params.gamma, params.n, params.C0);       
    t = sol.x;
    y = sol.y';
    
    % Find oscillation frequency
    freq = freqfind(t, y, params.tspan(2));
end