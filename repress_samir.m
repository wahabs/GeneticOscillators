function [per, freq, y,t] = repress_samir()
global n alpha0 alpha beta phi tspan peaktimes
n = 2.0;
alpha0 = 0;
phi = 0.19;
tspan = [0 2000.0];
% alpha = 10;
% beta = 1.0;
y0 = [0.0; 0.0; 0.0; 0.0; 0.0; 0.0; ];
[t,y] = ode45(@eom, tspan, y0);
[per,freq] = periodfind(y(:,1),t);

figure(1);hold on;clf
plot(t, y(:,1))
xlabel 'Time'; ylabel 'm1';
title(sprintf('Concentration of m1 vs. Time a = %0.1f, b = %0.1f', alpha, beta))
    
% figure(2); hold on
% plot(t, y(:,2), 'Color', rob{i})
% xlabel 'Time'; ylabel 'p3';
% title 'Concentration of p3 vs. Time'
% 
% figure(3); hold on
% plot(t, y(:,3), 'Color', rob{i})
% xlabel 'Time'; ylabel 'm2';
% title 'Concentration of m2 vs. Time'
% 
% figure(4); hold on
% plot(t, y(:,4), 'Color', rob{i})
% xlabel 'Time'; ylabel 'p1';
% title 'Concentration of p1 vs. Time'
% 
% figure(5); hold on
% plot(t, y(:,5), 'Color', rob{i})
% xlabel 'Time'; ylabel 'm3';
% title 'Concentration of m3 vs. Time'
% 
% figure(6);hold on
% plot(t, y(:,6), 'Color', rob{i})
% xlabel 'Time'; ylabel 'p2';
% title 'Concentration of p2 vs. Time'

function dydt = eom(Time,y)
global alpha n alpha0 beta phi 

dydt = [(alpha / (1.0 + y(2) ^ n) + alpha0 - y(1));
        beta*(y(5) - y(2));
        (alpha/(1.0 + y(4) ^ n) + alpha0 - y(3));
        beta*(y(1) - phi * y(4));
        (alpha/(1.0 + y(6) ^ n) + alpha0 - y(5));
        beta*(y(3) - y(6));
        ];

