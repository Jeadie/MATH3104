clear 

% Question 1
load('flydata.mat');
% rho is binary vector of spike (1) 
% stim is vector of stimulus at common time period to rho

n = 25; % Index of spike to consider

% Find index of first n spikes, and choose the last, or max, index. 
idx = max(find(rho==1, n));

% Plot the 150 timesteps prior to index
spike_trigg = stim(idx-150:idx-1, 1); 
plot(300:-2:1, spike_trigg); 
hold on 
xlabel('Time Before 25th spike (ms)'); 
ylabel('Stimulus');
title('Stimulus vs. Time Before 25th spike (ms)'); 
hold off 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Question 2
% Find indices of all spikes starting from timestep 150. Must add 150 to
% each to account for rho's indexing
indices = find(rho(150:length(rho), 1)==1, length(rho)) + 150;

sum_stim = zeros(150, 1); 

% Iterate through All spikes
for spike_idx = indices
    % Add stimulus of 150 timesteps prior to spike 
    sum_stim = sum_stim + stim(spike_idx-150:spike_idx-1, 1); 
end

% Average summation to get STA
sum_stim = sum_stim / length(indices);
plot(300:-2:1,sum_stim); 
hold on 
xlabel('Time Before spike (ms)'); 
ylabel('Spike Triggered Average Stimulus');
title('Spike Triggered Average Stimulus vs. Time Before spike (ms)'); 
hold off 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Question 3
% Question defined variables
m_f_rate = 20; % Mean firing rate
bin_s = 1E-3;  % time intervals/bin size of possible spikes
duration = 1; % spike train duration (s)

% Probability of spike in any given 1ms bin
p_interval = m_f_rate* bin_s;
% Create random spikes with p_interval chance
spike_vect = rand((duration/bin_s),1) <= p_interval;
%Plot 
plot((duration*bin_s:(duration*bin_s):duration).', spike_vect);
hold on 
xlabel('Time (ms)'); 
ylabel('Spike value (1/0)');
title('Spike value (1/0) vs Time (ms)'); 
hold off 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Question 4
% Question defined variables
m_f_rate = 20; % Mean firing rate
bin_s = 1E-3;  % time intervals/bin size of possible spikes
duration = 1; % spike train duration (s)
samples = 1000; % number of spike train trials

% Probability of spike in any given 1ms bin
p_interval = m_f_rate* bin_s;
% Create random spikes with p_interval chance for 1000 trials
spike_vect_samples = rand((duration/bin_s), samples) <= p_interval;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Question 5
%Average over each trials to get 1000 summations
trials = sum(spike_vect_samples);

% Plot with enough bins for individual (per integer) bins
hist(trials, max(trials)) 
hold on 
xlabel('Number of Spikes'); 
ylabel('Frequency');
title('Frequency of Spike Count over 1000 trials'); 
hold off 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Question 6
% Calcuate average and variance of trial values and calculate fano factor
avg = mean(trials); 
vari = var(trials); 
fano = vari/avg; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
