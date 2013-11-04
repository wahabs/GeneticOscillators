function [per] = periodfind(y,t)
global alpha n alpha0 beta phi tspan peaktimes
[p, l] = findpeaks(y(:,1));
p = l(2:end);
l = l(2:end);
npk = findpeaks(y(:,1)); rpk = findpeaks(-y(:,1));
if length(npk) == length(rpk) && isempty(npk) == 0
    osc = npk+rpk; osc = osc(2:end);
    l = l(osc>0.05*osc(1));
    peaktimes = vertcat(t(l),t(end));
    per = mean(diff(peaktimes));
elseif length(npk)~=length(rpk) && isempty(npk) == 0
    osc = npk + mean(rpk); osc = osc(2:end);
    l = l(osc>0.05*osc(1));
    peaktimes = vertcat(t(l),t(end));
    per = mean(diff(peaktimes));
elseif isempty(npk) == 1
    per = tspan(2);
end



