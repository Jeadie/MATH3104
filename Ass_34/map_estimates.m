function mapEstimate = map_estimates(spike_stimulus_probabilities, max_stimulus_spike_count, numStimPresentations )
    % Returns a vector of length max_stimulus_max_spike_count + 1 which at
    % index i, predicts the stimulus with the largest MAP given the spike count i-1
    
    % spike_stimulus_probabilities: is a 2D array which the first dimension
    % is individual stimuli. The second being a vector of length maximum
    % spike count + 1 where index i stores the probability that i-1 spikes
    % occured for that stimulus. 

    % max_stimulus_spike_count: The maximum spikes in any trial for any
    % stimuli. 
    
    % numStimPresentations: a vector indicating the number of times each
    %                       stimulus is presented.

    % instantiate empty Nan such that if any spike counts have no
    % occurences for any stimuli then no stimulus is predicted
    mapEstimate = NaN(1, max_stimulus_spike_count + 1); 
    
    % prior probabilities of each stimulus (proportion to number of trials)
    p_s = numStimPresentations/ sum(numStimPresentations); 
    
    % for each possible stimulus count
    for i = 1:max_stimulus_spike_count +1

        % find maximum probability of each stimulus
        [M, I] = max(spike_stimulus_probabilities(:, i).* p_s); 
        
        % if probability is greater than 0 for this index/stimulus, add 
        if M > 0
            mapEstimate(1, i) = I; 
        end
    end 
end

