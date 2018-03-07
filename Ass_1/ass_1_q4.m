% From Question
Vrest = -70E-3; % Resting Voltage
R_m = 10E6;  % Membrane Resistance 
tao = 10E-3; % Time Constant of membrane
Vm = -70E-3; % Membrane Voltage
Vth = -54E-3; % Threshold Voltage
Vreset = -80E-3;  % Reset Voltage once spiked
time = 0.5;  % Duration of simulation (s)

% Chosen values
Vspike = 0;  % Spiking voltage
dt = 1E-3; % Time Step 
I_max = 2E-9; % Applied current 

% Number of timesteps
iterations =  time/dt;

% Create current vector
I = zeros(iterations, 1); 
% Apply step function current for middle 300ms 
I(0.2* iterations + 1 : 0.8 * iterations) = I_max; 

% iterate through phase timesteps
for n= 1:iterations 

    % Manual Spikes
    if Vm >= Vth
        % Add Spike to plot vector but reset to Vreset underneath
        V(n, 1) = Vspike;
        Vm = Vreset;
    
    % Use the membrane equation
    else 
        % Update Vm from membrane equation, add to plot vector
        dv = (1/tao) * ((-1* Vm) + Vrest + R_m*I(n,1)) * dt;
        Vm = Vm + dv; % Euler increment Vm
        V(n, 1) = Vm; % add to plot vector 
    end 
end

plot(V); 
xlabel('Time (ms)')
ylabel('Membrane Volage (V)')
title('Membrane Volage (V) vs Time (ms)')

