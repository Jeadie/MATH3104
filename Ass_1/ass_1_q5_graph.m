% 0 to 10 ns in 100 increments
Iinj = 0:(10E-9/100):10E-9;

% Apply the simulated and expected spike rates 
spike_rate_actual = arrayfun(@ass_1_q5_actual, Iinj);
spike_rate_expected = arrayfun(@ass_1_q5_expect, Iinj);

hold on
plot(Iinj, spike_rate_actual);
plot(Iinj, spike_rate_expected);

xlabel('Injection current, (A)')
ylabel('firing rate (/s)')
title('Firing Rate (/s) vs Injection current (A)')


hold off
