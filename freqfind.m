function freq = freqfind(t, y, tspan)
    % Use only second half of data
    tspan = tspan/2;
    y = y(floor(length(t)/2):end);
    t = t(1:ceil(length(t)/2));

    Fs = length(y)/tspan; % Sample frequency
    nfft = 2^ceil(log2(length(y))); % Padded length of FFT
    
    Y = fft(y, nfft);
    Y = Y(1:nfft/2); % throw away second half of transform, since it's symmetric
    
    % zero out 1/500th of transform so it doesn't get counted when calculating the highest peak
    zero_pt = floor(nfft/500);
    Y(1:zero_pt) = 0;
    
    n = length(Y);
    power = abs(Y);
    
    f = (0:nfft/2-1)*Fs/nfft;
    
    [max_val max_ind] = max(power);
    
    freq = f(max_ind);
