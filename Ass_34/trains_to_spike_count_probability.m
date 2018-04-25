function spike_count_probabilities = trains_to_spike_count_probability( trains , trials)
    % Converts the spike train data, trains, into a 2D array of spike count 
    % probabilities. The first dimension is individual stimuli and the second
    % being a vector of length maximum spike count + 1 where index i 
    % stores the probability that i-1 spikes occured for that stimulus. 

    % trains: raw spike train data from generatetrains
    % trials: a vector which says how many trials occured for each stimuli

    % convert individual spike trains into spike counts per trial
    spike_count = sum(trains, 3);

    % Find the maximum number of spikes in a trial for each stimulus
    stimulus_max_spike_count = max(spike_count, [], 2); 
    
    % create probability matrix of [num of stimuli, max spike count + 1]
    spike_count_probabilities = zeros(5, max(stimulus_max_spike_count) + 1); 
    % For each stimuli, 
    for i = 1:5
        % go through each possible spike count
        for j = 1:stimulus_max_spike_count(i) + 1
            % Find number of occurence and divide by number of trials to get probability
            spike_count_probabilities(i, j) = sum(spike_count(i, :) == j-1) / trials(i, 1);
        end
    end
end

