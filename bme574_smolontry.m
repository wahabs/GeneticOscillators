function bme574_smolontry()
global alpha sigma z gamma_x gamma_y tauy
alpha = 1.0;
sigma = 1.0;
gamma_x = 1.0;
gamma_y = 1.0;
tauy = 1.0;
z = 0:5;
rob = {'r', 'b', 'k', 'c', 'y', 'm'};
tspan = [0 1000.0];
y0 = [0.0; 0.0];


[t,y] = ode45(@eom,tspan,y0);
figure(1);clf;hold on
plot(t,y(:,1),'b')
grid on
xlabel 'Time'; ylabel 'x';
title '[x] vs. Time'

figure(2);clf;hold on
plot(t,y(:,2),'r')
grid on
xlabel 'Time'; ylabel 'y';
title '[y] vs. Time'

% figure(2);clf;hold on
% for z=0:5
%     [t,y] = ode45(@eom, tspan, y0);
%     Y = fft(y(:,1));Y=fftshift(Y);
%     x = logspace(min(Y), max(Y), 20);
%     fsamp = 0.1;Tsamp = 1/fsamp;
%     T = (-0.5*length(Y))*Tsamp:Tsamp:(0.5*length(Y)-1)*Tsamp;
%     plot(T(floor(length(Y)/2):end), Y(floor(length(Y)/2):end),'Color', rob{z+1})
%     title(num2str(z))
%     axis([0 8e4 -4e4 4e4])
%     set(gca, 'XScale', 'log')
%     grid on
% end

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

function ddt = eom(Time,y)
global alpha sigma gamma_x gamma_y tauy

ddt = [(1 + y(1)^2 + alpha * sigma * y(1)^4) / ((1 + y(1)^2 + sigma * y(1)^4) * (1 + y(2)^4)) - gamma_x * y(1);
       ((1 + y(1)^2 + alpha * sigma * y(1)^4) / ((1 + y(1)^2 + sigma * y(1)^4) * (1 + y(2)^4)) - gamma_y * y(2)) / tauy;
        ];