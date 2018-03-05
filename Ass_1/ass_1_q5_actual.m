function firing_rate = ass_1_q5_actual( I_inj)

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
dt = 1E-4;

iterations =  time/dt;
I = zeros(iterations, 1); 

% Apply step function current for middle 300ms 
I(0.2* iterations + 1 : 0.8 * iterations) = I_inj; 

% iterate through phase timesteps
for n= 1:iterations 

    % Manual Spikes
    if Vm >= Vth
        V(n, 1) = Vspike;
        Vm = Vreset;
    
    % Use the membrane equation
    else 
        dv = (1/tao) * ((-1* Vm) + Vrest + R_m*I(n,1)) * dt
        Vm = Vm + dv;
        V(n, 1) = Vm; 
    end 
end

firing_rate = spikes / (0.6 * time); 
end

