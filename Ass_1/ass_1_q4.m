% From Question
Vrest = -70E-3; 
R_m = 10E6; 
tao = 10E-3; 
Vm = -70E-3;
Vth = -54E-3;
Vreset = -80E-3; 
time = 0.5; 

% Chosen values
Vspike = 0; 
dt = 1E-3;
I_max = 2E-9;


iterations =  time/dt;
I = zeros(iterations, 1); 

% Apply step function current for middle 300ms 
I(0.2* iterations + 1 : 0.8 * iterations) = I_max; 

% iterate through phase timesteps
for n= 1:iterations 

    % Manual Spikes
    if Vm >= Vth
        V(n, 1) = Vspike;
        Vm = Vreset;
    
    % Use the membrane equation
    else 
        dv = (1/tao) * ((-1* Vm) + Vrest + R_m*I(n,1)) * dt;
        Vm = Vm + dv;
        V(n, 1) = Vm; 
    end 
end

plot(V); 
xlabel('Time (ms)')
ylabel('Membrane Volage (V)')
title('Membrane Volage (V) vs Time (ms)')

