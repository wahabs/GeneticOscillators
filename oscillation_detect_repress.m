a = 0:1:20;
b = 0:1:20;
freqs = zeros(length(a), length(b));
for r = 1:length(a)
    for c = 1:length(b)
        alpha = a(r);
        beta = b(c);
        [per, y, t] = repress_samir(alpha, beta);
        freqs(r, c) = 1/per;
    end
end

figure(144);clf
contourf(b,a,freqs)
xlabel('Beta');
ylabel('alpha');
colorbar;
