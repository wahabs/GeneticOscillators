function run_parallel_sim(num, total_sims)
    dimension = sqrt(total_sims);

    oscillator = 'metabolator_mod';

    param1 = 'a3';
    param1_range = linspace(0, 2*3, 5);
    param1_val = param1_range(floor((num-1)/dimension)+1);

    param2 = 'B';
    param2_range = linspace(0, 20, 5);
    param2_val = param2_range(mod(num-1, dimension)+1);

    freq = eval(sprintf('simulate_%s(struct(param1, param1_val, param2, param2_val))', oscillator));

    fprintf('Completed simulation %i (%s = %g, %s = %g)\n', num, param1, param1_val, param2, param2_val)
    
    save(sprintf('%03i.mat', num), 'freq', 'oscillator', 'param1', 'param1_val', 'param2', 'param2_val');
end
