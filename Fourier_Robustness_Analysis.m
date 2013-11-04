function Fourier_Robustness_Analysis(y)
global alpha n alpha0 beta phi k7 z 
Y = fft(y);
fsamp = 1; Tsamp = 1/fsamp;
T = 0.0:Tsamp:((length(Y)-1)*Tsamp);
subplot(3,2,z+1)
hist(Y)
title(num2str(z+1))
xlabel 'Frequency';