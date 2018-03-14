

clear all

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
pause % Pauses just allow control over script to save figures for assignment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Question 2
spike_count  = 0; % Number of spike that have occured
spike_stimulus_sum = zeros(150, 1); % Summation of all the stimulus 

for i = 150:length(rho)
    if(rho(i) ==1) 
        spike_count = spike_count +1; 
        spike_stimulus_sum = spike_stimulus_sum + stim(i-150 : i-1, 1); 
    end
end

% Average summation to get STA
spike_stimiuls_average = spike_stimulus_sum/ spike_count; 
plot(1:2:300,spike_stimiuls_average); 
hold on 
xlabel('Time Before spike (ms)'); 
ylabel('Spike Triggered Average Stimulus');
title(' Question 2: Spike Triggered Average Stimulus vs. Time (ms)'); 
hold off 
pause
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
pause
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
pause
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
pause
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Question 6
% Calcuate average and variance of trial values and calculate fano factor
avg = mean(trials); 
vari = var(trials); 
fano = vari/avg
pause
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
