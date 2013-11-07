function [Y] = plot_periodogram(t,y)
  Y = fft(y);
  Y(1) = []; % remove first component - just sum of the data
  n = length(Y);
  power = abs(Y(1:floor(n/2))).^2;
  nyquist = 1/2;
  % freq = (1:n/2)/(n/2)*nyquist;

  min_freq = 1/t(end);
  max_freq = 1/min(diff(t));
  %freq = logspace(log10(min_freq), log10(max_freq), n/2);
  freq = linspace(min_freq, max_freq, n/2);

  plot(freq, power);
  xlabel('Frequency');
  ylabel('Power');