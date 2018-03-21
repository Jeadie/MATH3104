function mlEstimate = ml_estimates( spike_stimulus_probabilities, max_stimulus_max_spike_count )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    mlEstimate = NaN(1, max_stimulus_max_spike_count); 
    for i = 1:max_stimulus_max_spike_count +1
        [M, I] = max(spike_stimulus_probabilities(:, i)); 
        if M ~= 0
            mlEstimate(1, i) = I; 
        end
    end 

end

