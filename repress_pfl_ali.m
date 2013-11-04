function [per,y,t] = repress_pfl_ali()
global alpha n alpha0 beta phi k7 tspan peaktimes
alpha = 300.0;
n = 2.0;
alpha0 = 0.0;
beta = 0.2;
phi = 0.19;
k7 = 1.0;
tspan = [0 2000.0];
y0 = [0.0; 0.0; 0.0; 0.0; 0.0; 0.0; ];

[t,y] = ode45(@eom, tspan, y0);
figure(1);hold on
plot(t, y(:,1))
xlabel 'Time'; ylabel 'm1';
title 'Concentration of m1 vs. Time'

[per] = periodfind(y(:,1),t);

% figure(2); clf
% plot(t, y(:,2))
% xlabel 'Time'; ylabel 'p3';
% title 'Concentration of p3 vs. Time'
% 
% figure(3); clf
% plot(t, y(:,3))
% xlabel 'Time'; ylabel 'm2';
% title 'Concentration of m2 vs. Time'
% 
% figure(4); clf
% plot(t, y(:,4))
% xlabel 'Time'; ylabel 'p1';
% title 'Concentration of p1 vs. Time'
% 
% figure(5); clf
% plot(t, y(:,5))
% xlabel 'Time'; ylabel 'm3';
% title 'Concentration of m3 vs. Time'
% 
% figure(6); clf
% plot(t, y(:,6))
% xlabel 'Time'; ylabel 'p2';
% title 'Concentration of p2 vs. Time'

function dydt = eom(Time,y)
global alpha n alpha0 beta phi k7

dydt = [0.0 - y(1) + (alpha / (1.0 + y(2) ^ n) + alpha0) + ((k7 * (alpha0 - y(1)) * alpha) / (1.0 + y(4) ^ n));
        beta * (y(5) - y(2));
        0.0 - y(3) + (alpha / (1.0 + y(4) ^ n) + alpha0);
        beta * (y(1) - phi * y(4));
        0.0 - y(5) + (alpha / (1.0 + y(6) ^ n) + alpha0);
        beta * (y(3) - y(6));
        ];