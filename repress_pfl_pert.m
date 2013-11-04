function repress_pfl_pert()
global alpha n alpha0 beta phi k7 z 
alpha = 300.0;
n = 2.0;
alpha0 = 0.0;
beta = 0.2;
phi = 0.19;
k7 = 1.0;
z = 0:5;
rob = {'r', 'b', 'k', 'c', 'y', 'm'};
tspan = [0 1000.0];
y0 = [0.0; 0.0; 0.0; 0.0; 0.0; 0.0; ];



figure(1);clf;hold on
for z=0:5
    [t,y] = ode45(@eom, tspan, y0);
    plot(t, y(:,1), rob{z+1})
    grid on
    xlabel 'Time'; ylabel 'm1';
    title 'Concentration of m1 vs. Time'
end
figure(2);clf;hold on
for z=0:5
    [t,y] = ode45(@eom, tspan, y0);
    Y = fft(y(:,1));Y=fftshift(Y);
    x = logspace(min(Y), max(Y), 20);
    fsamp = 0.1;Tsamp = 1/fsamp;
    T = (-0.5*length(Y))*Tsamp:Tsamp:(0.5*length(Y)-1)*Tsamp;
    plot(T(floor(length(Y)/2):end), Y(floor(length(Y)/2):end),'Color', rob{z+1})
    title(num2str(z))
    axis([0 8e4 -4e4 4e4])
    %set(gca, 'XScale', 'log')
    grid on
end

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
global alpha n alpha0 beta phi k7 z 

dydt = [0.0 - y(1) + (alpha / (1.0 + y(2) ^ n) + alpha0) + ((k7 * (alpha0 - y(1)) * alpha) / (1.0 + y(4) ^ n) + triggerAt(0.0, Time - 250.0, z));
        beta * (y(5) - y(2));
        0.0 - y(3) + (alpha / (1.0 + y(4) ^ n) + alpha0);
        beta * (y(1) - phi * y(4));
        0.0 - y(5) + (alpha / (1.0 + y(6) ^ n) + alpha0);
        beta * (y(3) - y(6));
        ];
function r = triggerAt(d,c,t)
    if (c>=0) 
        r = t;
    else
        r = d;
    end