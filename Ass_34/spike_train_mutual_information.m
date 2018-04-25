function Im = spike_train_mutual_information( spike_stimulus_probabilities, p_s )
    % Returns the expected mutual information of the spike train by 
    % finding the total entropy and removing the noise. 
    
    % spike_stimulus_probabilities: is a 2D array which the first dimension
    % is individual stimuli. The second being a vector of length maximum
    % spike count + 1 where index i stores the probability that i-1 spikes
    % occured for that stimulus. 
   
    % p_s is a vector of the prior probabilities of seeing each stimuli. 
    %}

    % find individual entropy components
    entropy = -1 * spike_stimulus_probabilities .* log(spike_stimulus_probabilities); 
    % ignore nan terms (because of limits)
    entropy(isnan(entropy)) = 0; 
    % sum entropy per stimulus
    stimulus_entropy = sum(entropy); 
    % weighted sum of stimulus to find overall noise
    H_noise = sum(stimulus_entropy * p_s);

    % 
    p_response = sum(spike_stimulus_probabilities) /5 ;
    % individual entropy of responses
    entropy_response = -1 * p_response .* log(p_response); 
    % ignore nan
    entropy_response(isnan(entropy_response)) = 0; 
    % mutual information is response entropy - noise.
    Im = sum(entropy_response) - H_noise; 

end

