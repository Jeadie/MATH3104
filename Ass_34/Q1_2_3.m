%Question 1
stimulus_time = 1;
binSize = 1E-3;
numStimPresentations = 100*ones(5, 1);
rateOfStimulus = 10* [1,2,3,4,5].';
seed = 1; 

spikes = generatetrains(stimulus_time, binSize, numStimPresentations, rateOfStimulus, seed);

%Question 2
spike_count = sum(spikes, 3); 

% Question 3
% Find the maximum number of spikes in a trial for each stimulus
stimulus_max_spike_count = max(spike_count, [], 2); 
% create empty result matrix
pns = zeros(5, max(stimulus_max_spike_count) + 1); 
hold on
%Used to index colours for plotting of different stimuli. 
plot_stimlus_colours = ['r', 'b', 'y', 'g', 'm']

% For each stimuli, 
for i = 1:5
    % go through each possible spike count
    for j = 1:stimulus_max_spike_count(i) + 1
        % Find number of occurence and divide by number of trials to get probability
        pns(i, j) = sum(spike_count(i, :) == j-1) / numStimPresentations(i, 1);
    end
    % plot spike count against probabilities
    plot(0:1:max(stimulus_max_spike_count), pns(i, :), plot_stimlus_colours(i)); 
end

% Add design to graph
legend('Stimulus 1', 'Stimulus 2', 'Stimulus 3', 'Stimulus 4', 'Stimulus 5')
xlabel('Number of spikes occured')
ylabel('Probability')
title('The probability of spike totals for given stimuli')
hold off

% Question 4
mlEstimate = NaN(1, max(stimulus_max_spike_count)); 
for i = 1:max(stimulus_max_spike_count) +1
    [M, I] = max(spike_stimulus_probabilities(:, i)); 
    if M ~= 0
        mlEstimate(1, i) = I; 
    end
end 
plot(0:1:max(stimulus_max_spike_count), mlEstimate); 
xlabel('Spike Count'); 
ylabel('Maximum likelihood Stimulus'); 
title('ML Stimulus for each spike frequency'); 
pause

% Question 4
mapEstimate = NaN(1, max(stimulus_max_spike_count)); 
p_s = numStimPresentations/ sum(numStimPresentations); 
for i = 1:max(stimulus_max_spike_count) +1
    [M, I] = max(spike_stimulus_probabilities(:, i).* p_s); 
    if M ~= 0
        mapEstimate(1, i) = I; 
    end
end 

plot(0:1:max(stimulus_max_spike_count), mapEstimate); 
xlabel('Spike Count'); 
ylabel('Maximum a posteriori Stimulus'); 
title('MAP Stimulus for each spike frequency'); 

hold off
new_num_stim_presentations = [100, 100, 400, 100, 100].';
ml_est2 = ml_estimates(spike_stimulus_probabilities, max(stimulus_max_spike_count))
map_est2 = map_estimates(spike_stimulus_probabilities, max(stimulus_max_spike_count), new_num_stim_presentations); 
plot(ml_est2)
hold on
plot(map_est2)


