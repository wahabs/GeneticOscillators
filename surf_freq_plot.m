function surf_freq_plot(x, y, freq_data )
    surfc(log(x), log(y), log(freq_data));
    xlabel('\tau_y');
    ylabel('\sigma');
    zlabel('Frequency');
end

