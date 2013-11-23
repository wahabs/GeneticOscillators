clear; clc; clf

%%

oscillator = 'smolon';
mapsize = 10; % Resolution of the heat map

% Paramaters to be varied and their default values
paramset  = {'sigma','tau_y','gamma_x','gamma_y','alpha'};
paramvals = [    1.5,  10000,    0.105,    0.036,    11 ];

% Scale factors of the lower and upper bound for each parameter range
lowbound = 0;
highbound = 3;


%%

numvar = numel(paramset);

ranges = zeros(numvar,2);
for u = 1:numvar
    ranges(u,1) = lowbound*paramvals(u);
    ranges(u,2) = highbound*paramvals(u);    
end


% Figure Counter
fignum = 1;
      
for p = 1:numvar
    
    param1 = paramset{p};
    param1_range = linspace(ranges(p,1),ranges(p,2),mapsize);
    
    for q = p+1:numvar
        
        param2 = paramset{q};
        param2_range = linspace(ranges(q,1),ranges(q,2),mapsize);
        
        freqs = sensitivity_analysis(oscillator, param1, param1_range, param2, param2_range);
        
        % Plot the heatmap
        figure(fignum); 
        fignum = fignum+1;
        contourf(param1_range, param2_range, freqs);
        colorbar;
        xlabel(param1);
        ylabel(param2);
        title(sprintf('%s - resolution of %i x',oscillator,mapsize));
        
        % Save the figure
        figname = strcat(param1,'_',param2);
        print('-dpng',figname) % As a .png
        hgsave(figname) % As a .fig
        
    end
end
    