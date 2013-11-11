function [Y] = plot_periodogram(t,y)
  tspan = 2000; % Simulation time
  Fs = length(y)/tspan; % Sampling frequency
  nfft = 2^ceil(log2(length(y))); % Length of FFT

  Y = fft(y, nfft);
  Y = Y(1:nfft/2); % throw away second half since it's symmetric

  n = length(Y);
  power = abs(Y);

  freq = (0:nfft/2-1)*Fs/nfft;

  disp(length(freq))
  disp(length(power))

  plot(freq, power);
  xlabel('Frequency');
  ylabel('Power');
