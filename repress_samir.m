function [y, t, per] = repress_samir()
tspan = [0 2000.0];
alpha = 250.0;
beta = 0.2;
alpha0 = 0.0;
n = 2.0;
y0 = [0.0; 0.0; 0.0; 0.0; 0.0; 0.0; ];
[t,y] = ode45(@repressilator_ODE, tspan, y0, [], alpha, beta, alpha0, n);
% per = periodfind(y(:,1),t);
% freq = freqfind(t, y(:,1), tspan(2));
% per = 1/freq;

figure(1);hold on;clf
plot(t, y(:,1), 'b')
xlabel 'Time'; ylabel 'm1';
title 'Concentration of m1 vs. Time'
    
figure(2); hold on;clf
plot(t, y(:,2), 'Color', 'r')
xlabel 'Time'; ylabel 'p1';
title 'Concentration of p1 vs. Time'

figure(3); hold on;clf
plot(t, y(:,3), 'Color', 'k')
xlabel 'Time'; ylabel 'm2';
title 'Concentration of m2 vs. Time'

figure(4); hold on;clf
plot(t, y(:,4), 'Color', 'm')
xlabel 'Time'; ylabel 'p2';
title 'Concentration of p2 vs. Time'

figure(5); hold on;clf
plot(t, y(:,5), 'Color', 'g')
xlabel 'Time'; ylabel 'm3';
title 'Concentration of m3 vs. Time'

figure(6);hold on;clf
plot(t, y(:,6), 'Color', 'c')
xlabel 'Time'; ylabel 'p3';
title 'Concentration of p3 vs. Time'
