function params = get_params(default_params, opt)
    % Integrates specified params into default params

    params = struct();

    param_names = fieldnames(default_params);
    for i = 1:length(param_names)
        param_name = param_names{i};

        if(~isfield(opt, param_name))
            params = setfield(params, param_name, getfield(default_params, param_name));
        else
            params = setfield(params, param_name, getfield(opt, param_name));
        end
    end
end
