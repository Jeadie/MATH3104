%{ 
m_f_rate = 20; 
bin_s = 1E-3; 
duration = 1;
p_interval = m_f_rate* bin_s;
spike_vect = rand((duration/bin_s),1) <= p_interval;
plot((duration*bin_s:(duration*bin_s):duration).', spike_vect);
%}

% Question 5

m_f_rate = 20; 
bin_s = 1E-3; 
duration = 1;
p_interval = m_f_rate* bin_s;
samples = 1000;
spike_vect_samples = rand((duration/bin_s), samples) <= p_interval;
trials = sum(spike_vect_samples);
hist(trials) 
% plot((duration*bin_s:(duration*bin_s):duration).', spike_vect_samples);