function [per, freq] = periodfind(y,t)
global alpha beta tspan peaktimes OSC
[p, l] = findpeaks(y(:,1), 'THRESHOLD', 0.000);
[rp,rl] = findpeaks(-y(:,1), 'THRESHOLD', 0.000);
if isempty(p)
    DEBUG = 'NO PEAKS';
elseif length(p) == 1
    DEBUG = 'ONE PEAK';
else
    DEBUG = 'DEFAULT';
end
switch DEBUG
    case 'NO PEAKS'
        per = tspan(2);
    case 'ONE PEAK'
        per = tspan(2);
    case 'DEFAULT'
        transl = l(p == max(p));
        npk = p(l>transl);
        if numel(rp) >= length(p)
            rpk = rp(l>transl);
        else
            rpk = rp;
        end
        if length(npk) == length(rpk)
            osc = npk+rpk;
            l = l(osc>0.05*osc(1));
            peaktimes = vertcat(t(l),t(end));
            per = mean(diff(peaktimes));
        elseif length(npk)~=length(rpk)
            osc = npk + mean(rpk);
            l = l(osc>0.05*osc(1));
            peaktimes = vertcat(t(l),t(end));
            per = mean(diff(peaktimes));
        end
end

if per == tspan(2);
    fprintf('alpha = %0.4f, beta = %0.4f, Not Oscillating\n',alpha, beta)
    OSC = 0;
elseif per > 0.05*tspan(2) && peaktimes(length(peaktimes)-1) <= peaktimes(end)-1.5*per
    fprintf('alpha = %0.4f, beta = %0.4f, Not Oscillating\n',alpha, beta)
    OSC = 0;
elseif peaktimes(length(peaktimes)-1) >= peaktimes(end)-1.5*per
    fprintf('alpha = %0.4f, beta = %0.4f, Oscillating\n',alpha, beta)
    OSC = 1;
end

if OSC == 0;
    freq = 0;
elseif OSC == 1;
    freq = 1/per;
end