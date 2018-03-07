function firing_rate = ass_1_q5_expect( Iinj )
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
    dt = 1E-4; % Time Step 
    
    % Apply formula from assignment
    firing_rate = 1 /(tao * log( (R_m * Iinj + Vrest - Vreset) / (R_m * Iinj + Vrest - Vth)) );

end

