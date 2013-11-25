function run_sim(num, total_sims)
    oscillator = 'smolon';
    param1 = 'sigma';
    param1_range = linspace(0, 3*1.5, total_sims);
    param2 = 'gamma_y';
    param2_range = linspace(0, 3*0.036, total_sims);
    
    param1_val = param1_range(num);
    freqs = sensitivity_analysis(oscillator, param1, [param1_val], param2, param2_range);
    
    save(sprintf('%03i.mat', num), 'freqs', 'oscillator', 'param1', 'param1_range', 'param2', 'param2_range', 'param1_val');
end
