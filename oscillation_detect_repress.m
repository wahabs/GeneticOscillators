a = 0:4:20;
b = 0:4:20;
freqs = zeros(length(a), length(b));
for r = 1:length(a)
    for c = 1:length(b)
        alpha = a(r);
        beta = b(c);
        [per, y, t] = repress_samir(alpha, beta);
        freqs(r, c) = 1/per;
        
        if per == tspan(2);
            disp('Not Oscillating')
            OSCDETECT(r,c) = 0;
        elseif per > 0.05*tspan(2) && peaktimes(length(peaktimes)-1) <= peaktimes(end)-1.5*per
            disp('Not Oscillating')
            OSCDETECT(r,c) = 0;
        elseif peaktimes(length(peaktimes)-1) >= peaktimes(end)-1.5*per
            disp('Oscillating')
            %fprintf('Oscillating with Period %0.4f \n and frequency %0.4e\n', per, 1/per)
            OSCDETECT(r,c) = 1;
        end
    end
end

figure(144);clf
contourf(b,a,freqs)
xlabel('Beta');
ylabel('alpha');
colorbar;