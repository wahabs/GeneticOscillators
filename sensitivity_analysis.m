function freqs = sensitivity_analysis(oscillator, param1, param1_range, param2, param2_range)

    % oscillator: 'repressilator' or 'smolon' or 'repressilator_pfl'
    % param1: a parameter you want to vary (ex: 'alpha')
    % param1_range: the range for param1 (ex: [250 300 350])
    % param2, param2_range: same syntax as param1

    freqs = zeros(length(param1_range), length(param2_range));

    tic;
    total_sims = length(param1_range)*length(param2_range);

    for a = 1:length(param1_range)
        for b = 1:length(param2_range)
            param_vals = struct(param1, param1_range(a), param2, param2_range(b));
            eval(sprintf('freqs(a,b) = simulate_%s(param_vals);', oscillator));

            time_elapsed = toc;
            sims_finished = (a-1)*length(param2_range)+b;
            sims_remaining = total_sims - sims_finished;
            time_remaining = (time_elapsed/sims_finished)*sims_remaining;

            % Display progress
            fprintf('Completed %i/%i simulations (%is elapsed, ~%is remaining)\n',...
                sims_finished, total_sims, round(time_elapsed), round(time_remaining));
        end
    end
end
