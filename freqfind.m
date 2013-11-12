function freq = freqfind(t, y, tspan)
  Fs = length(y)/tspan; % Sample frequency
  nfft = 2^ceil(log2(length(y))); % Padded length of FFT

  Y = fft(y, nfft);
  Y = Y(1:nfft/2); % throw away second half, since it's symmetric

  % zero out 1/500th of data so it doesn't get counted
  zero_pt = floor(nfft/500);
  Y(1:zero_pt) = 0;

  n = length(Y);
  power = abs(Y);

  f = (0:nfft/2-1)*Fs/nfft;

  [maxVal maxInd] = max(power)

  freq = f(maxInd);
