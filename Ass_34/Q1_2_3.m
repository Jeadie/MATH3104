%Question 1
% variables from question 
stimulus_time = 1;
binSize = 1E-3;
numStimPresentations = 100*ones(5, 1);
rateOfStimulus = 10* [1,2,3,4,5].';
seed = 1; 

% generated spike train
spikes = generatetrains(stimulus_time, binSize, numStimPresentations, rateOfStimulus, seed);


%Question 2
% Sum over third dimension to get spikes per train for each trial and
% stimulus
spikeSums = sum(spikes, 3); 
% find max of each trial and then max of each stimulus to find ultimate max
maxN = max(max(spikeSums)); 


% Question 3
% Find the maximum number of spikes in a trial for each stimulus
stimulus_max_spike_count = max(spikeSums, [], 2); 
% create empty result matrix
pns = zeros(5, max(stimulus_max_spike_count) + 1); 

%Used to index colours for plotting of different stimuli. 
plot_stimlus_colours = ['r', 'b', 'y', 'g', 'm'];
hold on

% For each stimuli, 
for i = 1:5
    % go through each possible number of spikes in a trial. 
    for j = 1:stimulus_max_spike_count(i) + 1
        % Find number of occurence and divide by number of trials to get probability
        pns(i, j) = sum(spikeSums(i, :) == j-1) / numStimPresentations(i, 1);
    end
    % plot spike count against probabilities with custom colour
    plot(0:1:max(stimulus_max_spike_count), pns(i, :), plot_stimlus_colours(i)); 
end

% Add design to graph
legend('Stimulus 1', 'Stimulus 2', 'Stimulus 3', 'Stimulus 4', 'Stimulus 5')
xlabel('Number of spikes occured')
ylabel('Probability')
title('The probability of spike totals for given stimuli')
hold off
pause


% Question 4
% Get the ML estimates from the spike_train probabilities. ml_estimates is
% a custom function. 
mlEstimate = ml_estimates(pns, max(stimulus_max_spike_count)); 
% plot and label
plot(0:1:max(stimulus_max_spike_count), mlEstimate); 
xlabel('Spike Count'); 
ylabel('Maximum likelihood Stimulus'); 
title('ML Stimulus for each spike frequency'); 
pause

% Question 5
% Get the MAP estimates from the spike_train probabilities. map_estimates
% is a custom function. 
mapEstimate = map_estimates(pns, max(stimulus_max_spike_count),numStimPresentations);  
% plot and label
plot(0:1:max(stimulus_max_spike_count), mapEstimate); 
xlabel('Spike Count'); 
ylabel('Maximum a posteriori Stimulus'); 
title('MAP Stimulus for each spike frequency'); 
pause

% Question 6 
%Change the number of presentations for stimulus 3
new_num_stim_presentations = [100, 100, 400, 100, 100].';
% get MAP and ML for new number of presentation stimulus. Note ML is
% independent of these priors
ml_estimates2 = ml_estimates(pns, max(stimulus_max_spike_count)); 
map_estimates2 = map_estimates(pns, max(stimulus_max_spike_count), new_num_stim_presentations);

% plot and label
plot(ml_estimates2, 'r')
hold on
plot(map_estimates2, 'b')
xlabel('Spike Count'); 
ylabel('Estimated stimulus'); 
title('Estimated Stimulus for each spike frequency'); 
legend('Maximum Likelihood', 'Maximum a posteriori'); 
hold off
pause 
%Question 7

% vector to store mutual information for varying stimulus presentation
% lengths
I_t = zeros(7, 1); 

% for each spike_length 
for i = 1:7
    % create a spike train with new presentation length
    spike_trains = generatetrains(i, binSize, numStimPresentations, rateOfStimulus, seed);
    % convert spike trains to spiketrain totals frequencies 
    spike_probabilities = trains_to_spike_count_probability(spike_trains ,numStimPresentations ); 
    % find entropy of spikes (0.2 is probability of each stimulus (equal))
    I_t(i, 1) = spike_train_mutual_information(spike_probabilities, 0.2);
end
plot(1:7, I_t)
hold on 

% Calculate the probability of each stimulus
p_stim = numStimPresentations / sum(numStimPresentations); 
% calculate entropy of stimulus in general
H_stim = -1 * sum(p_stim .* log(p_stim))

%plot on same graph and label axis and title. 
plot(1:7 , H_stim* ones(1, 7), 'r');
xlabel('Time period of stimulus presentation, (s)')
ylabel('Entropy')
title('Entropy of spike trains of varying presentation lengths compared to entropy of stimulus')
legend('Entropy of varying stimulus presentation lengths') 
