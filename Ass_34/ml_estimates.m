function mlEstimate = ml_estimates( spike_stimulus_probabilities, max_stimulus_spike_count )
    % returns a vector of length max_stimulus_max_spike_count + 1 which at
    % index i, predicts the stimulus with the largest maximum likelihood given 
    % the spike count i-1

    % spike_stimulus_probabilities: is a 2D array which the first dimension
    % is individual stimuli. The second being a vector of length maximum
    % spike count + 1 where index i stores the probability that i-1 spikes
    % occured for that stimulus. 

    % max_stimulus_spike_count: The maximum spikes in any trial for any
    % stimuli
    
    % instantiate empty Nan such that if any spike counts have no
    % occurences for any stimuli then no stimulus is predicted
    mlEstimate = NaN(1, max_stimulus_spike_count +1); 
    
    % for each possible stimulus count
    for i = 1:max_stimulus_spike_count +1
        % find maximum probability of each stimulus
        [M, I] = max(spike_stimulus_probabilities(:, i)); 
        
        % if probability is greater than 0 for this index/stimulus, add 
        if M > 0
            mlEstimate(1, i) = I; 
        end
    end 
end

