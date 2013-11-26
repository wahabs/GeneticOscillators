function mapper(oscillator,mapsize)
%% Define the variables

% mapsize specifies the resolution of the contour plot (mapsize x mapsize)

% Scale factors of the lower and upper bound for each parameter range
lowbound = 1e-5;
highbound = 3;


% Define paramaters to be varied and their default values

if strcmp(oscillator,'goodwin')
    
    paramset  = {'K','gamma','n','C0','lag'};
    paramvals = [  1,   1080,  2,   5,    1];
    
elseif strcmp(oscillator,'IRMA')
    
    disp('This feature not yet available')
    
elseif strcmp(oscillator,'metabolator')
    
    disp('This feature not yet available')
   
elseif strcmp(oscillator,'repressilator')
    
    % To avoid a contourf error, give alpha0 a positive value
    paramset  = {'alpha','beta','alpha0','n'};
    paramvals = [    300,   0.2,    1e-5,  2]; 
    
elseif strcmp(oscillator,'repressilator_pfl')
    
    paramset  = {'alpha','beta','alpha0','n', 'k'};
    paramvals = [    300,   0.2,    1e-5,  2,   1]; 

elseif strcmp(oscillator,'smolon')

    paramset  = {'sigma','tau_y','gamma_x','gamma_y','alpha'};
    paramvals = [    1.5,  10000,    0.105,    0.036,    11 ];

end


numvar = numel(paramset);

ranges = zeros(numvar,2);
for u = 1:numvar
    ranges(u,1) = lowbound*paramvals(u);
    ranges(u,2) = highbound*paramvals(u);    
end


%% Make the heatmaps

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
        contourf(param2_range, param1_range, freqs);
        colorbar;
        ylabel(param1);
        xlabel(param2);
        title(sprintf('%s - resolution of %i x',oscillator,mapsize));
        
        % Save the figure
        figname = strcat(param1,'_',param2);
        print('-dpng',figname) % As a .png
        hgsave(figname) % As a .fig
        
    end
end


end