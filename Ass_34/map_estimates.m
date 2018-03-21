function mapEstimate = map_estimates(spike_stimulus_probabilities, max_stimulus_max_spike_count, numStimPresentations )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    mapEstimate = NaN(1, max_stimulus_max_spike_count); 
    p_s = numStimPresentations/ sum(numStimPresentations); 
    for i = 1:max_stimulus_max_spike_count +1
        [M, I] = max(spike_stimulus_probabilities(:, i).* p_s); 
        if M ~= 0
            mapEstimate(1, i) = I; 
        end
    end 
end

