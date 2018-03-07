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

% sra value from question 
tao_sra = 100E-3; % Time Constant for Spike rate Adaptation
dg_sra = 0.3; % SRA increment value
V_k = -70E-3; % Comparison voltage for SRA (equilibrium point)
r_sra = 1; % Resistance value for SRA (considered in tao_sra)
g_sra_init = 0;  % initial value for g
g_sra = g_sra_init; % Current g value in Euler iterations 

iterations =  time/dt;

% Create current vector
I = zeros(iterations, 1); 
% Apply step function current for middle 300ms 
I(0.2* iterations + 1 : 0.8 * iterations) = I_max; 


% iterate through phase timesteps
for n= 1:iterations 

    % Manual Spikes 
    if Vm >= Vth
        % Set Spike in plot vector but reset voltage underneath
        V(n, 1) = Vspike; % Add spike to plot vector 
        Vm = Vreset;
        % increment g_sra
        g_sra += dg_sra; 

    % Use the membrane equation
    else 
        % Update Vm via equation
        dv = (1/tao) * ((-1* Vm) + Vrest + R_m*I(n,1) - g_sra * r_sra * (Vm - V_k) ) * dt ; 
        Vm = Vm + dv; % Euler Increment
        
        % Spike rate adaptation variable updates
        dg = (-1 * g_sra/tao_sra) * dt;
        g_sra = g_sra + dg; % add sra decay to g_sra
        V(n, 1) = Vm; % Add voltage to plot vector 
    end 
end

hold on 
xlabel('Time (ms)')
ylabel('Membrane Voltage (V) ')
title('Membrane Voltage with spike rate adaptation(V) vs Time (ms)')
plot(V); 
hold off

