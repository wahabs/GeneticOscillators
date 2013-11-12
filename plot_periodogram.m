function [Y] = plot_periodogram(t,y)
  tspan = 2000; % Simulation time
  Fs = length(y)/tspan; % Sampling frequency
  nfft = 2^ceil(log2(length(y))); % Length of FFT

  Y = fft(y, nfft);
  Y = Y(1:nfft/2); % throw away second half since it's symmetric
  Y(1:floor(nfft/500)) = 0;
  Y(1) = 0; % first number is just the sum of the rest

  n = length(Y);
  power = abs(Y);

  freq = (0:nfft/2-1)*Fs/nfft;
  
  [maxVal maxInd] = max(power);
  disp(maxInd);
  disp(freq(maxInd));

  plot(freq, power);
  xlabel('Frequency');
  ylabel('Power');