global alpha n alpha0 beta phi tspan peaktimes OSC
a = 0:1:10;
b = 0:0.1:1;
OSCDETECT = zeros(length(a), length(b));
for r = 1:length(a)
    for c = 1:length(b)
        alpha = a(r);
        beta = b(c);
        [per, freq, y, t] = repress_samir;
        OSCDETECT(r,c) = OSC;
        FREQDATA(r,c) = freq;
    end
end

figure(2);clf
contourf(b,a,OSCDETECT, [1 0])
xlabel('Beta');ylabel('alpha')
        

