function Im = spike_train_entropy( spike_stimulus_probabilities, p_s )
    entropy = -1 * spike_stimulus_probabilities .* log(spike_stimulus_probabilities); 
    entropy(isnan(entropy)) = 0; 
    stimulus_entropy = sum(entropy); 
    H_noise = sum(stimulus_entropy * p_s);

    p_response = sum(spike_stimulus_probabilities) /5 ;
    entropy_response = -1 * p_response .* log(p_response); 
    entropy_response(isnan(entropy_response)) = 0; 
    Im = sum(entropy_response) - H_noise; 

end

