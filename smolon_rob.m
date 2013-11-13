function [y, t, per] = smolon_rob()
%global sigma tauy gamma_x gamma_y alpha
% a = [0.44 2.22];
alpha = 11.0;
sigma = 1.5;
gamma_x = .105;
gamma_y = .036;
tauy = 10000;
tspan = [20000.0 400000.0];
y0 = [0.0; 0.0];
[t,y] = ode45(@smolon_ODE, tspan, y0, [], sigma, tauy, gamma_x, gamma_y, alpha);

figure(1);
plot(t, y(:,1), 'r')
xlabel 'Time'; ylabel '[x]';
title '[x] vs. Time'

figure(2);
plot(t, y(:,2), 'b')
xlabel 'Time'; ylabel '[y]';
title '[y] vs. Time'
    
[per] = periodfind(y(:,2),t);
if per > 0.05*tspan(2) && peaktimes(length(peaktimes)-1) <= peaktimes(end)-1.5*per
    disp('Not Oscillating')
elseif peaktimes(length(peaktimes)-1) >= peaktimes(end)-1.5*per
    fprintf('Oscillating with Period %0.4f \n and frequency %0.4e\n', per, 1/per)
end

%currently altering tauy.  I will record here the ratios of tauy amplitude
%to total amplitude of y.
%tauy =   1: <01%
%tauy =   2: <01%
%tauy =   3: <01%
%tauy =   4: <01%
%tauy = 4.2: ~02%
%tauy =4.23: ~03%
%tauy =4.24: ~03%
%tauy=4.245: ~03%
%tauy=4.247: ~04%
%tauy=4.249: <05% LOWER CUTOFF
%tauy =4.25: ~12%
%tauy = 4.3: ~15%
%tauy = 4.5: ~20%
%tauy =   5: ~20%
%tauy =  10: ~23%
%tauy =  20: ~17%
%tauy =  30: ~17%
%tauy =  40: ~15%
%tauy = 100: ~14%
%tauy =1000: ~13%
%tauy =5000: ~12%
%tauy =5250: ~12%
%tauy =5375: ~12%
%tauy =5400: ~12% UPPER LIMIT
%tauy =5450: too wide.
%tauy =5500: too wide.
%tauy =6000: too wide.
%tauy =7000: too wide.
%tauy=10000: too wide.
%RANGE [4.249 5400]

%sigma=0.20: x<01%  y<01%
%sigma=0.30: x<01%  y<01%
%sigma=0.40: x<05%  y<01%
%sigma=0.43: x~10%  y~02%
%sigma=0.44: x~22%  y~04%
%sigma=0.45: x~42%  y~07% LOWER LIMIT
%sigma=0.50: x~35%  y~13%
%sigma=1.50: x~79%  y~22%
%sigma=2.10: x~76%  y~20%
%sigma=2.20: x~68%  y~15% UPPER LIMIT
%sigma=2.22: x~08%  y~01%
%sigma=2.25: x~02%  y<01%
%sigma=2.30: x~01%  y<01%
%sigma=2.50: x<05%  y<01%
%RANGE [0.45 2.20]