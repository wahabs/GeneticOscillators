function heatmap(oscillator, param1, param1_range, param2, param2_range)
    freqs = sensitivity_analysis(oscillator, param1, param1_range, param2, param2_range);

    clf;
    figure(1);
    contourf(param1_range, param2_range, freqs);
    colorbar;
    xlabel(param1);
    ylabel(param2);
    title(sprintf('Frequency Heatmap (%s)', oscillator));
end