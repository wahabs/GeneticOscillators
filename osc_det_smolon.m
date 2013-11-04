global alpha sigma tauy gamma_x gamma_y tspan peaktimes
a = 0.4:0.5:5.0; % sigma
b = 4:500:10000; % tau_y
OSCDETECT = zeros(length(a), length(b));
FREQDATA = zeros(length(a),length(b));

tic;
for r = 1:length(a)
    for c = 1:length(b)
        
        sigma = a(r);
        tauy = b(c);
        
        [y, t, per] = smolon_ali;
        if per == tspan(2);
            disp('Not Oscillating')
            OSCDETECT(r,c) = 0;
            FREQDATA(r,c) = 0;
        elseif per > 0.05*tspan(2) && peaktimes(length(peaktimes)-1) <= peaktimes(end)-1.5*per
            disp('Not Oscillating')
            OSCDETECT(r,c) = 0;
            FREQDATA(r,c) = 0;
        elseif peaktimes(length(peaktimes)-1) >= peaktimes(end)-1.5*per
            disp('Oscillating')
            %fprintf('Oscillating with Period %0.4f \n and frequency %0.4e\n', per, 1/per)
            OSCDETECT(r,c) = 1;
            FREQDATA(r,c) = 1/per;
        end
        
        done = (r-1)*length(b)+c;
        total = length(a)*length(b);
        time_left = (toc/done)*(total-done);
        
        fprintf('sigma = %g, tau_y = %g (%i/%i, %g secs left)\n', sigma, tauy, done, total, time_left);
        
        if(mod(done, 5) == 0)
            contour_plot(b, a, OSCDETECT);
        end
    end
end

OSCDETECT

%%

contour_plot(b, a, OSCDETECT);
surf_freq_plot(b, a, FREQDATA)
