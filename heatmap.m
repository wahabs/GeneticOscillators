function freqs = heatmap(oscillator, param1, param1_range, param2, param2_range)
    freqs = sensitivity_analysis(oscillator, param1, param1_range, param2, param2_range);

    clf; close all;
    figure(1);
    contourf(param2_range, param1_range, freqs);
    colorbar;
    ylabel(param1);
    xlabel(param2);
    title(sprintf('Frequency Heatmap (%s)', strrep(oscillator, '_', '\_')));
end
