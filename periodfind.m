function [per] = periodfind(y,t)
global alpha n alpha0 beta phi tspan peaktimes OSC
[p, l] = findpeaks(y(:,1));
[rp,rl] = findpeaks(-y(:,1));
if isempty(p)
    DEBUG = 'No Peaks';
else
    DEBUG = 'DEFAULT';
end
switch DEBUG
    case 'No Peaks'
        per = tspan(2);
    case 'DEFAULT'
        if numel(p) > 1
            transl = l(p == max(p));
            npk = p(l>transl);
        end
        if numel(rp) >= l(end)
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
    OSC = 0;
elseif per > 0.05*tspan(2) && peaktimes(length(peaktimes)-1) <= peaktimes(end)-1.5*per
    disp('Not Oscillating')
    OSC = 0;
elseif peaktimes(length(peaktimes)-1) >= peaktimes(end)-1.5*per
    disp('Oscillating')
    %fprintf('Oscillating with Period %0.4f \n and frequency %0.4e\n', per, 1/per)
    OSC = 1;
end